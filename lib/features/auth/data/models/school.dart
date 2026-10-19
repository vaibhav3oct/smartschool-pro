import 'package:cloud_firestore/cloud_firestore.dart';

/// School model used across the app for tenant-level metadata.
/// The app is intentionally multi-tenant and every school document must contain
/// a `schoolId` to scope access and Firestore rules.
class School {
  const School({
    required this.id,
    required this.name,
    required this.shortName,
    required this.address,
    required this.city,
    required this.state,
    required this.country,
    required this.email,
    required this.phone,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
    this.isDeleted = false,
  });

  final String id;
  final String name;
  final String shortName;
  final String address;
  final String city;
  final String state;
  final String country;
  final String email;
  final String phone;
  final String status;
  final DateTime createdAt;
  final DateTime updatedAt;
  final bool isDeleted;

  factory School.fromJson(Map<String, dynamic> json) {
    return School(
      id: json['id'] as String? ?? '',
      name: json['name'] as String? ?? '',
      shortName: json['shortName'] as String? ?? '',
      address: json['address'] as String? ?? '',
      city: json['city'] as String? ?? '',
      state: json['state'] as String? ?? '',
      country: json['country'] as String? ?? 'India',
      email: json['email'] as String? ?? '',
      phone: json['phone'] as String? ?? '',
      status: json['status'] as String? ?? 'pending',
      createdAt: DateTime.tryParse(json['createdAt'] as String? ?? '') ??
          DateTime.now(),
      updatedAt: DateTime.tryParse(json['updatedAt'] as String? ?? '') ??
          DateTime.now(),
      isDeleted: json['isDeleted'] as bool? ?? false,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'shortName': shortName,
      'address': address,
      'city': city,
      'state': state,
      'country': country,
      'email': email,
      'phone': phone,
      'status': status,
      'createdAt': createdAt.toIso8601String(),
      'updatedAt': updatedAt.toIso8601String(),
      'isDeleted': isDeleted,
    };
  }

  School copyWith({
    String? id,
    String? name,
    String? shortName,
    String? address,
    String? city,
    String? state,
    String? country,
    String? email,
    String? phone,
    String? status,
    DateTime? createdAt,
    DateTime? updatedAt,
    bool? isDeleted,
  }) {
    return School(
      id: id ?? this.id,
      name: name ?? this.name,
      shortName: shortName ?? this.shortName,
      address: address ?? this.address,
      city: city ?? this.city,
      state: state ?? this.state,
      country: country ?? this.country,
      email: email ?? this.email,
      phone: phone ?? this.phone,
      status: status ?? this.status,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      isDeleted: isDeleted ?? this.isDeleted,
    );
  }
}

/// Repository for reading and writing school documents in Firestore.
class SchoolRepository {
  SchoolRepository({FirebaseFirestore? firestore})
      : _firestore = firestore ?? FirebaseFirestore.instance;

  final FirebaseFirestore _firestore;

  CollectionReference<Map<String, dynamic>> get _schools =>
      _firestore.collection('schools');

  Future<School?> fetchSchool(String schoolId) async {
    final doc = await _schools.doc(schoolId).get();
    if (!doc.exists || doc.data() == null) return null;
    return School.fromJson({
      ...doc.data()!,
      'id': doc.id,
    });
  }

  Future<void> createSchool(School school) async {
    await _schools.doc(school.id).set(school.toJson());
  }

  Future<void> updateSchool(String schoolId, Map<String, dynamic> updates) async {
    await _schools.doc(schoolId).update({
      ...updates,
      'updatedAt': DateTime.now().toIso8601String(),
    });
  }
}
