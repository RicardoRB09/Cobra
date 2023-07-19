// Dart imports:
import 'dart:convert';

LoginResponse loginResponseFromJson(String str) =>
    LoginResponse.fromJson(json.decode(str));

String loginResponseToJson(LoginResponse data) => json.encode(data.toJson());

class LoginResponse {
  final String userId;
  final String token;

  LoginResponse({
    required this.userId,
    required this.token,
  });

  factory LoginResponse.fromJson(Map<String, dynamic> json) => LoginResponse(
        userId: json["userId"],
        token: json["token"],
      );

  Map<String, dynamic> toJson() => {
        "userId": userId,
        "token": token,
      };
}
