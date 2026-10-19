import 'package:firebase_auth/firebase_auth.dart';

enum AppUserRole {
  superAdmin,
  schoolAdmin,
  principal,
  teacher,
  student,
  parent,
  accountant,
  librarian,
  transportManager,
  hostelManager;

  static AppUserRole fromString(String value) {
    switch (value) {
      case 'superAdmin':
        return AppUserRole.superAdmin;
      case 'schoolAdmin':
        return AppUserRole.schoolAdmin;
      case 'principal':
        return AppUserRole.principal;
      case 'teacher':
        return AppUserRole.teacher;
      case 'student':
        return AppUserRole.student;
      case 'parent':
        return AppUserRole.parent;
      case 'accountant':
        return AppUserRole.accountant;
      case 'librarian':
        return AppUserRole.librarian;
      case 'transportManager':
        return AppUserRole.transportManager;
      case 'hostelManager':
        return AppUserRole.hostelManager;
      default:
        return AppUserRole.student;
    }
  }

  String get value {
    switch (this) {
      case AppUserRole.superAdmin:
        return 'superAdmin';
      case AppUserRole.schoolAdmin:
        return 'schoolAdmin';
      case AppUserRole.principal:
        return 'principal';
      case AppUserRole.teacher:
        return 'teacher';
      case AppUserRole.student:
        return 'student';
      case AppUserRole.parent:
        return 'parent';
      case AppUserRole.accountant:
        return 'accountant';
      case AppUserRole.librarian:
        return 'librarian';
      case AppUserRole.transportManager:
        return 'transportManager';
      case AppUserRole.hostelManager:
        return 'hostelManager';
    }
  }
}

class AppUser {
  const AppUser({
    required this.id,
    required this.fullName,
    required this.email,
    required this.schoolId,
    required this.role,
    required this.isActive,
    required this.createdAt,
    required this.updatedAt,
  });

  final String id;
  final String fullName;
  final String email;
  final String schoolId;
  final AppUserRole role;
  final bool isActive;
  final DateTime createdAt;
  final DateTime updatedAt;

  factory AppUser.fromJson(Map<String, dynamic> json) {
    return AppUser(
      id: json['id'] as String? ?? '',
      fullName: json['fullName'] as String? ?? '',
      email: json['email'] as String? ?? '',
      schoolId: json['schoolId'] as String? ?? '',
      role: AppUserRole.fromString(json['role'] as String? ?? 'student'),
      isActive: json['isActive'] as bool? ?? true,
      createdAt: DateTime.tryParse(json['createdAt'] as String? ?? '') ??
          DateTime.now(),
      updatedAt: DateTime.tryParse(json['updatedAt'] as String? ?? '') ??
          DateTime.now(),
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'fullName': fullName,
        'email': email,
        'schoolId': schoolId,
        'role': role.value,
        'isActive': isActive,
        'createdAt': createdAt.toIso8601String(),
        'updatedAt': updatedAt.toIso8601String(),
      };

  factory AppUser.fromFirebaseUser(
    User user, {
    String schoolId = 'school-demo',
    AppUserRole role = AppUserRole.student,
    String fullName = 'SmartSchool User',
  }) {
    return AppUser(
      id: user.uid,
      fullName: user.displayName ?? fullName,
      email: user.email ?? '',
      schoolId: schoolId,
      role: role,
      isActive: true,
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
    );
  }

  AppUser copyWith({
    String? id,
    String? fullName,
    String? email,
    String? schoolId,
    AppUserRole? role,
    bool? isActive,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return AppUser(
      id: id ?? this.id,
      fullName: fullName ?? this.fullName,
      email: email ?? this.email,
      schoolId: schoolId ?? this.schoolId,
      role: role ?? this.role,
      isActive: isActive ?? this.isActive,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }
}
