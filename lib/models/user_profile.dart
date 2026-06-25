/// User Profile Model
/// 
/// Represents user profile data stored in Firestore
class UserProfile {
  final String uid;
  final String email;
  final String? displayName;
  final String? phoneNumber;
  final String? photoUrl;
  final DateTime createdAt;
  final DateTime updatedAt;
  final bool isEmailVerified;
  final Map<String, dynamic>? preferences;

  UserProfile({
    required this.uid,
    required this.email,
    this.displayName,
    this.phoneNumber,
    this.photoUrl,
    required this.createdAt,
    required this.updatedAt,
    required this.isEmailVerified,
    this.preferences,
  });

  UserProfile copyWith({
    String? uid,
    String? email,
    String? displayName,
    String? phoneNumber,
    String? photoUrl,
    DateTime? createdAt,
    DateTime? updatedAt,
    bool? isEmailVerified,
    Map<String, dynamic>? preferences,
  }) {
    return UserProfile(
      uid: uid ?? this.uid,
      email: email ?? this.email,
      displayName: displayName ?? this.displayName,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      photoUrl: photoUrl ?? this.photoUrl,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      isEmailVerified: isEmailVerified ?? this.isEmailVerified,
      preferences: preferences ?? this.preferences,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'uid': uid,
      'email': email,
      'displayName': displayName,
      'phoneNumber': phoneNumber,
      'photoUrl': photoUrl,
      'createdAt': createdAt.toIso8601String(),
      'updatedAt': updatedAt.toIso8601String(),
      'isEmailVerified': isEmailVerified,
      'preferences': preferences,
    };
  }

  factory UserProfile.fromJson(Map<String, dynamic> json) {
    return UserProfile(
      uid: json['uid'] as String,
      email: json['email'] as String,
      displayName: json['displayName'] as String?,
      phoneNumber: json['phoneNumber'] as String?,
      photoUrl: json['photoUrl'] as String?,
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
      isEmailVerified: json['isEmailVerified'] as bool,
      preferences: json['preferences'] as Map<String, dynamic>?,
    );
  }

  @override
  String toString() {
    return 'UserProfile(uid: $uid, email: $email, displayName: $displayName)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is UserProfile &&
        other.uid == uid &&
        other.email == email &&
        other.displayName == displayName;
  }

  @override
  int get hashCode {
    return uid.hashCode ^ email.hashCode ^ displayName.hashCode;
  }
}
