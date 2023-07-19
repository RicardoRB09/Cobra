import 'dart:convert';

RegisterResponse registerResponseFromJson(String str) =>
    RegisterResponse.fromJson(json.decode(str));

String registerResponseToJson(RegisterResponse data) =>
    json.encode(data.toJson());

class RegisterResponse {
  final String emailAddress;
  final String firstName;
  final String lastName;
  final DateTime dateOfBirth;
  final String password;

  RegisterResponse({
    required this.emailAddress,
    required this.firstName,
    required this.lastName,
    required this.dateOfBirth,
    required this.password,
  });

  factory RegisterResponse.fromJson(Map<String, dynamic> json) =>
      RegisterResponse(
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
