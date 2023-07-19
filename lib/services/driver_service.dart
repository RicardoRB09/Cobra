import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';

import '../models/driver.dart';

import 'package:http/http.dart' as http;

import '../presentation/global/environment.dart';

class DriverService extends ChangeNotifier {
  Future<List<Driver>> getDriver() async {
    final response = await http.get(
      Uri.parse('${Environment.apiURL}/driver'),
      headers: {'Content-Type': 'application/json'},
    );

    switch (response.statusCode) {
      case 200:
        final List<dynamic> driversJson = json.decode(response.body);
        final drivers =
            driversJson.map((json) => Driver.fromJson(json)).toList();
        notifyListeners();
        return drivers;
      default:
        log('driver error--> ${response.statusCode}');
        return [];
    }
  }

  Future<String> createDriver(String name, String lastName, String identity,
      String address, String picture, int vehicleId) async {
    final data = {
      "name": name,
      "lastName": lastName,
      "identity": identity,
      "address": address,
      "picture": picture,
      "vehicleId": vehicleId,
    };

    final response = await http.post(
      Uri.parse('${Environment.apiURL}/driver'),
      body: jsonEncode(data),
      headers: {'Content-Type': 'application/json'},
    );

    log('statusCode --> ${response.statusCode}');

    switch (response.statusCode) {
      case 200:
        return '200';

      case 201:
        return '201';

      // case 400:
      //   return jsonDecode(response.body)[0]['description'];

      default:
        return 'Check your credentials and try again.';
    }
  }
}
