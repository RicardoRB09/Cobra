import 'package:flutter/material.dart';

class LoginProvider extends ChangeNotifier {
  bool _obscureText = false;

  String email = '';
  String password = '';
  final emailCtrl = TextEditingController();
  final pswdCtrl = TextEditingController();

  bool get obscureText => _obscureText;

  set obscureText(bool value) {
    _obscureText = value;
    notifyListeners();
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

  String? passWordValidator(String value) {
    if (value.isEmpty || value.trim().isEmpty) {
      return 'Field is required.';
    }

    return null;
  }

  void clearTxtEditingCtrlr() {
    emailCtrl.clear();
    pswdCtrl.clear();
  }
}
