class User {
  final String username;
  final String password;
  final String? email;
  final String? confirmPassword;

  User({required this.username, required this.password, this.email, this.confirmPassword});

  Map<String, dynamic> toMap() {
    return {
      'username': username,
      'password': password,
      'email': email,
      'confirmPassword': confirmPassword,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      username: map['username'],
      password: map['password'],
      email: map['email'],
      confirmPassword: map['confirmPassword'],
    );
  }
}