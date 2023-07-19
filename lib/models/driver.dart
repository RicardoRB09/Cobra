import 'dart:convert';

List<Driver> driverFromJson(String str) =>
    List<Driver>.from(json.decode(str).map((x) => Driver.fromJson(x)));

String driverToJson(List<Driver> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Driver {
  final int id;
  final String name;
  final String lastName;
  final String identity;
  final String address;
  final String? picture;
  final int vehicleId;

  Driver({
    required this.id,
    required this.name,
    required this.lastName,
    required this.identity,
    required this.address,
    this.picture,
    required this.vehicleId,
  });

  factory Driver.fromJson(Map<String, dynamic> json) => Driver(
        id: json["id"],
        name: json["name"],
        lastName: json["lastName"],
        identity: json["identity"],
        address: json["address"],
        picture: json["picture"],
        vehicleId: json["vehicleId"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "lastName": lastName,
        "identity": identity,
        "address": address,
        "picture": picture,
        "vehicleId": vehicleId,
      };
}
