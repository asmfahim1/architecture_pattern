class UserProfile {
  final String name;
  final String email;
  final String profileImageUrl;

  UserProfile({required this.name, required this.email, required this.profileImageUrl});

  UserProfile copyWith({String? name, String? email, String? profileImageUrl}) {
    return UserProfile(
      name: name ?? this.name,
      email: email ?? this.email,
      profileImageUrl: profileImageUrl ?? this.profileImageUrl,
    );
  }
}