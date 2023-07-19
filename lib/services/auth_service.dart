// Dart imports:
import 'dart:convert';
import 'dart:developer';

// Flutter imports:
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

// Package imports:
import 'package:http/http.dart' as http;

// Project imports:
import 'package:cobra/models/login_response.dart';
import '../presentation/global/environment.dart';

class AuthService with ChangeNotifier {
  bool _isAuthenticating = false;
  bool _isRegistering = false;
  String savedEmail = '';

  final _storage = const FlutterSecureStorage();

  bool get isAuthenticating => _isAuthenticating;
  set isAuthenticating(bool value) {
    _isAuthenticating = value;
    notifyListeners();
  }

  bool get isRegistering => _isRegistering;
  set isRegistering(bool value) {
    _isRegistering = value;
    notifyListeners();
  }

  Future<void> getSavedEmail() async {
    const storage = FlutterSecureStorage();
    savedEmail = await storage.read(key: 'email') ?? '';
  }

  static Future<String?> getToken() async {
    const storage = FlutterSecureStorage();
    return await storage.read(key: 'token');
  } //getToken

  static Future<void> deleteToken() async {
    const storage = FlutterSecureStorage();
    await storage.delete(key: 'token');
  } //deleteToken

  static saveParameter(String key, String value) async {
    const storage = FlutterSecureStorage();
    await storage.write(key: key, value: value);
  }

  static deleteParameter(String key) async {
    const storage = FlutterSecureStorage();
    await storage.delete(key: key);
  }

  Future<bool> login(String email, String password) async {
    isAuthenticating = true;

    final data = {
      'emailAddress': email,
      'password': password,
    };

    final response = await http.post(
      Uri.parse('${Environment.apiURL}/authentication/login'),
      body: jsonEncode(data),
      headers: {'Content-Type': 'application/json'},
    );

    switch (response.statusCode) {
      case 200:
        final loginResponse = loginResponseFromJson(response.body);
        log('responseBody --> ${loginResponse.toJson()}');
        await _saveToken(loginResponse.token);
        await saveParameter('email', email);
        isAuthenticating = false;
        return true;
      case 404:
        log('404 Error');
        isAuthenticating = false;
        return false;

      default:
        log('error--> ${response.statusCode}');
        isAuthenticating = false;
        return false;
    }
  } //login

  Future register(String email, String firstName, String lastName,
      String birthday, String password) async {
    isRegistering = true;

    final data = {
      "emailAddress": email,
      "firstName": firstName,
      "lastName": lastName,
      "dateOfBirth": birthday,
      "password": password,
    };

    final response = await http.post(
      Uri.parse('${Environment.apiURL}/authentication/register'),
      body: jsonEncode(data),
      headers: {'Content-Type': 'application/json'},
    );

    switch (response.statusCode) {
      case 200:
        isRegistering = false;
        return '200';

      case 400:
        isRegistering = false;
        return jsonDecode(response.body)[0]['description'];

      // case 404:
      //   log('404 Error');
      //   isRegistering = false;
      //   return false;

      default:
        log('error--> ${response.statusCode}');
        isRegistering = false;
        return 'Check your credentials and try again.';
    }
  } //register

  Future isLoggedIn() async {
    final token = await _storage.read(key: 'token');
    log('token read --> $token');

    if (token != null) {
      return true;
    }

    return false;
  } //isLoggedIn

  Future _saveToken(String token) async {
    return await _storage.write(key: 'token', value: token);
  } //_saveToken

  Future logout() async {
    await _storage.delete(key: 'token');
  }
  //logout
}
