import 'dart:developer';

import 'package:cobra/services/driver_service.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../helpers/show_alerts.dart';
import '../../models/driver.dart';

class DriverProvider extends ChangeNotifier {
  bool isLoadingDrivers = false;
  List<Driver> _drivers = [];
  final nameCtrl = TextEditingController();
  final lastNameCtrl = TextEditingController();
  final idCtrl = TextEditingController();
  final addressCtrl = TextEditingController();
  final vehicleIdCtrl = TextEditingController();

  final driverService = DriverService();

  DriverProvider() {
    _initialize();
  }

  List<Driver> get drivers => _drivers;

  void _initialize() async {
    log('message');
    await getDrivers();
    log('message --> ${drivers.length}');
  }

  Future<void> getDrivers() async {
    isLoadingDrivers = true;
    notifyListeners();

    _drivers = await driverService.getDriver();

    isLoadingDrivers = false;
    notifyListeners();
  }

  Future createDriver(
      String name,
      String lastName,
      String identity,
      String address,
      String picture,
      int vehicleId,
      BuildContext context) async {
    isLoadingDrivers = true;
    notifyListeners();

    final response = await driverService.createDriver(
        name, lastName, identity, address, picture, vehicleId);

    if (response == '201') {
      clearTxtEditingCtrlr();
      showAlert(
        context,
        'Driver Created Successfully!',
        "Let's continue....",
        'Continue',
        () => context.pushReplacement('/home/0'),
      );
    } else {
      showAlert(
        context,
        'Driver creation Failed',
        "Check your data and try it again....",
        'Ok',
        () => context.pop(),
      );
    }

    isLoadingDrivers = false;
    notifyListeners();
  }

  void clearTxtEditingCtrlr() {
    nameCtrl.clear();
    lastNameCtrl.clear();
    idCtrl.clear();
    addressCtrl.clear();
    vehicleIdCtrl.clear();
  }

  String? textFieldValidator(String value) {
    if (value.isEmpty || value.trim().isEmpty) {
      return 'Field is required.';
    }

    return null;
  }
}
