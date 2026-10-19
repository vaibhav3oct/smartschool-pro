import 'package:cloud_firestore/cloud_firestore.dart';

/// User repository pattern for Firestore-backed profile and role management.
class UserRepository {
  UserRepository({FirebaseFirestore? firestore})
      : _firestore = firestore ?? FirebaseFirestore.instance;

  final FirebaseFirestore _firestore;

  CollectionReference<Map<String, dynamic>> get _users =>
      _firestore.collection('users');

  Future<Map<String, dynamic>?> fetchUserProfile(String uid) async {
    final doc = await _users.doc(uid).get();
    if (!doc.exists || doc.data() == null) return null;
    return doc.data();
  }

  Future<void> saveUserProfile(String uid, Map<String, dynamic> data) async {
    await _users.doc(uid).set({
      ...data,
      'updatedAt': DateTime.now().toIso8601String(),
    }, SetOptions(merge: true));
  }

  Future<void> updateUserRole(String uid, String role) async {
    await _users.doc(uid).update({
      'role': role,
      'updatedAt': DateTime.now().toIso8601String(),
    });
  }
}
