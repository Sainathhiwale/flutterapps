
class User {
  int id;
  final String username;
  final String password;

  User({ required this.id, required this.username, required this.password});

  // Add methods for serialization/deserialization
  Map<String, dynamic> toMap() => {'username': username, 'password': password};

  static User fromMap(Map<String, dynamic> map) => User(
    id: map['id'] as int,
    username: map['username'] as String,
    password: map['password'] as String,
  );
}