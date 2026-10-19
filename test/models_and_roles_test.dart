import 'package:flutter_test/flutter_test.dart';

import 'package:smartschool_pro/features/auth/data/models/app_user.dart';
import 'package:smartschool_pro/features/auth/data/models/school.dart';

void main() {
  group('AppUser model', () {
    test('serializes and deserializes correctly', () {
      final now = DateTime(2026, 1, 1);
      final user = AppUser(
        id: 'u1',
        fullName: 'Test User',
        email: 'test@example.com',
        schoolId: 'school-1',
        role: AppUserRole.teacher,
        isActive: true,
        createdAt: now,
        updatedAt: now,
      );

      final json = user.toJson();
      final parsed = AppUser.fromJson(json);

      expect(parsed.id, 'u1');
      expect(parsed.role, AppUserRole.teacher);
      expect(parsed.email, 'test@example.com');
      expect(json['role'], 'teacher');
    });
  });

  group('School model', () {
    test('stores tenant metadata and can round-trip', () {
      final createdAt = DateTime(2026, 2, 2);
      final school = School(
        id: 'school-1',
        name: 'Apex Academy',
        shortName: 'APEX',
        address: '123 Main Road',
        city: 'Delhi',
        state: 'Delhi',
        country: 'India',
        email: 'admin@apex.edu',
        phone: '+91 9876543210',
        status: 'active',
        createdAt: createdAt,
        updatedAt: createdAt,
      );

      final json = school.toJson();
      final parsed = School.fromJson(json);

      expect(parsed.id, 'school-1');
      expect(parsed.status, 'active');
      expect(parsed.name, 'Apex Academy');
      expect(json['country'], 'India');
    });
  });
}
