import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../features/auth/data/models/app_user.dart';
import '../../features/auth/presentation/providers/auth_provider.dart';

final routeGuardProvider = Provider<RouteGuard>((ref) => RouteGuard(ref));

class RouteGuard {
  const RouteGuard(this._ref);

  final Ref _ref;

  AppUser? get currentUser => _ref.read(authControllerProvider).user;

  bool isAuthenticated() => currentUser != null;

  bool canAccess(AppUserRole requiredRole) {
    final user = currentUser;
    if (user == null) return false;
    if (user.role == AppUserRole.superAdmin) return true;
    return user.role == requiredRole;
  }

  bool canAccessSchool(String schoolId) {
    final user = currentUser;
    if (user == null) return false;
    if (user.role == AppUserRole.superAdmin) return true;
    return user.schoolId == schoolId;
  }
}
