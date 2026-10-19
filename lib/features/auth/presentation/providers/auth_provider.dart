import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/models/app_user.dart';

class AuthState {
  const AuthState({
    this.user,
    this.isLoading = false,
    this.errorMessage,
  });

  final AppUser? user;
  final bool isLoading;
  final String? errorMessage;

  AuthState copyWith({
    AppUser? user,
    bool? isLoading,
    String? errorMessage,
  }) {
    return AuthState(
      user: user ?? this.user,
      isLoading: isLoading ?? this.isLoading,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}

final authControllerProvider =
    StateNotifierProvider<AuthController, AuthState>((ref) {
  return AuthController();
});

class AuthController extends StateNotifier<AuthState> {
  AuthController() : super(const AuthState());

  final FirebaseAuth _auth = FirebaseAuth.instance;

  bool get isAuthenticated => state.user != null;

  Future<void> restoreSession() async {
    final currentUser = _auth.currentUser;
    if (currentUser == null) {
      state = const AuthState();
      return;
    }

    state = state.copyWith(
      user: AppUser.fromFirebaseUser(
        currentUser,
        role: _detectRoleFromEmail(currentUser.email ?? ''),
      ),
    );
  }

  Future<void> signIn({
    required String email,
    required String password,
  }) async {
    state = state.copyWith(isLoading: true, errorMessage: null);
    try {
      final credential = await _auth.signInWithEmailAndPassword(
        email: email.trim(),
        password: password.trim(),
      );

      final user = credential.user;
      if (user == null) {
        throw FirebaseAuthException(
          code: 'user-not-found',
          message: 'No authenticated user found.',
        );
      }

      state = state.copyWith(
        isLoading: false,
        user: AppUser.fromFirebaseUser(
          user,
          role: _detectRoleFromEmail(user.email ?? ''),
          schoolId: 'school-demo',
        ),
      );
    } on FirebaseAuthException catch (e) {
      state = state.copyWith(
        isLoading: false,
        errorMessage: _friendlyErrorMessage(e),
      );
    } catch (_) {
      state = state.copyWith(
        isLoading: false,
        errorMessage: 'Unable to sign in. Please try again.',
      );
    }
  }

  Future<void> signUp({
    required String fullName,
    required String email,
    required String password,
    required AppUserRole role,
    required String schoolId,
  }) async {
    state = state.copyWith(isLoading: true, errorMessage: null);
    try {
      final credential = await _auth.createUserWithEmailAndPassword(
        email: email.trim(),
        password: password.trim(),
      );

      final user = credential.user;
      if (user == null) {
        throw FirebaseAuthException(
          code: 'user-not-created',
          message: 'User was not created.',
        );
      }

      await user.updateDisplayName(fullName);

      state = state.copyWith(
        isLoading: false,
        user: AppUser.fromFirebaseUser(
          user,
          fullName: fullName,
          role: role,
          schoolId: schoolId,
        ),
      );
    } on FirebaseAuthException catch (e) {
      state = state.copyWith(
        isLoading: false,
        errorMessage: _friendlyErrorMessage(e),
      );
    } catch (_) {
      state = state.copyWith(
        isLoading: false,
        errorMessage: 'Unable to create account. Please try again.',
      );
    }
  }

  Future<void> signOut() async {
    state = state.copyWith(isLoading: true);
    await _auth.signOut();
    state = const AuthState();
  }

  AppUserRole _detectRoleFromEmail(String email) {
    final normalized = email.toLowerCase();
    if (normalized.contains('superadmin')) return AppUserRole.superAdmin;
    if (normalized.contains('admin')) return AppUserRole.schoolAdmin;
    if (normalized.contains('teacher')) return AppUserRole.teacher;
    if (normalized.contains('parent')) return AppUserRole.parent;
    return AppUserRole.student;
  }

  String _friendlyErrorMessage(FirebaseAuthException error) {
    switch (error.code) {
      case 'user-not-found':
        return 'No account found with that email.';
      case 'wrong-password':
        return 'Incorrect password. Please try again.';
      case 'email-already-in-use':
        return 'This email is already in use.';
      case 'weak-password':
        return 'Password is too weak. Use a stronger password.';
      case 'invalid-email':
        return 'Please enter a valid email address.';
      default:
        return error.message ?? 'Authentication failed.';
    }
  }
}
