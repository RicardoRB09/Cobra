// To parse this JSON data, do
//
//     final vehicle = vehicleFromJson(jsonString);

import 'dart:convert';

List<Vehicle> vehicleFromJson(String str) =>
    List<Vehicle>.from(json.decode(str).map((x) => Vehicle.fromJson(x)));

String vehicleToJson(List<Vehicle> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Vehicle {
  final String name;
  final String description;
  final int capacity;
  final int providerId;
  final int vehicleTypeId;
  final int driverId;
  final int id;

  Vehicle({
    required this.name,
    required this.description,
    required this.capacity,
    required this.providerId,
    required this.vehicleTypeId,
    required this.driverId,
    required this.id,
  });

  factory Vehicle.fromJson(Map<String, dynamic> json) => Vehicle(
        name: json["name"],
        description: json["description"],
        capacity: json["capacity"],
        providerId: json["providerId"],
        vehicleTypeId: json["vehicleTypeId"],
        driverId: json["driverId"],
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "description": description,
        "capacity": capacity,
        "providerId": providerId,
        "vehicleTypeId": vehicleTypeId,
        "driverId": driverId,
        "id": id,
      };
}
