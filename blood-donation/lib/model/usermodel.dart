class UserModel {
  final String username;
  final String email;

  UserModel({
    required this.username,
    required this.email,
  });

  // Convert UserModel to JSON
  Map<String, dynamic> toJson() {
    return {
      'name': username,
      'email': email,
    };
  }

  // Create UserModel from JSON
  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      username: json['username'] as String,
      email: json['email'] as String,
    );
  }
}
