import 'package:flutter/material.dart';

class RegisterProvider extends ChangeNotifier {
  final firstNameCtrl = TextEditingController();
  final lastNameCtrl = TextEditingController();
  final emailCtrl = TextEditingController();
  final pswdCtrl = TextEditingController();
  final birthCtrl = TextEditingController();
  String birthFormattedToRegister = '';

  String? nameValidator(String value) {
    if (value.isEmpty || value.trim().isEmpty) {
      return 'Field is required.';
    }
    return null;
  }

  String? passWordValidator(String value) {
    final pswdRegExp = RegExp(
        r'^(?=.*[A-Z])(?=.*[a-z])(?=.*[!@#\$%^&*()\-\=_+{}\[\]|;:<>,./?]).+$');

    if (value.isEmpty || value.trim().isEmpty) {
      return 'Field is required.';
    }

    if (value.length < 8) {
      return 'Password must have at least 8 characters.';
    }

    if (!pswdRegExp.hasMatch(value)) {
      return 'Password must contain at least an UpperCase, a LowerCase and a Special Character.';
    }
    return null;
  }

  String? emailValidator(String value) {
    final emailRegExp = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');

    if (value.isEmpty || value.trim().isEmpty) {
      return 'Field is required.';
    }

    if (value.trim().length < 3) {
      return 'Field must contains more than three characters.';
    }

    if (!emailRegExp.hasMatch(value)) {
      return 'Invalid email address format.';
    }
    return null;
  }

  String? birthdayValidator(String value) {
    if (value.isEmpty || value.trim().isEmpty) {
      return 'Field is required.';
    }
    return null;
  }

  void clearTxtEditingCtrlr() {
    firstNameCtrl.clear();
    lastNameCtrl.clear();
    emailCtrl.clear();
    pswdCtrl.clear();
    birthCtrl.clear();
    birthFormattedToRegister = '';
  }
}
