class UserModel {
  final String userName;
  final String email;
  final String role;
  final String password;
  final String confirmPassword;
  final String userId;

  UserModel({
    required this.userName,
    required this.email,
    required this.role,
    required this.password,
    required this.confirmPassword,
    required this.userId,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      userName: json['userName'],
      email: json['email'],
      role: json['role'],
      password: json['password'],
      confirmPassword: json['confirmPassword'],
      userId: json['userId'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'userName': userName,
      'email': email,
      'role': role,
      'password': password,
      'confirmPassword': confirmPassword,
      'userId': userId,
    };
  }
}
