// Dart imports:
import 'dart:convert';

User usuarioFromJson(String str) => User.fromJson(json.decode(str));

String usuarioToJson(User data) => json.encode(data.toJson());

class User {
  final String emailAddress;
  final String firstName;
  final String lastName;
  final DateTime dateOfBirth;
  final String password;

  User({
    required this.emailAddress,
    required this.firstName,
    required this.lastName,
    required this.dateOfBirth,
    required this.password,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
        emailAddress: json["emailAddress"],
        firstName: json["firstName"],
        lastName: json["lastName"],
        dateOfBirth: DateTime.parse(json["dateOfBirth"]),
        password: json["password"],
      );

  Map<String, dynamic> toJson() => {
        "emailAddress": emailAddress,
        "firstName": firstName,
        "lastName": lastName,
        "dateOfBirth": dateOfBirth.toIso8601String(),
        "password": password,
      };
}
