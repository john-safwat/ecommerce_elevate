// 🐦 Flutter imports:
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:injectable/injectable.dart';

@singleton
class AppConfigProvider extends ChangeNotifier {
  String _token = "";
  String _email = "";

  String get email => _email;

  set email(String value) {
    _email = value;
    notifyListeners();
  }

  String get token => _token;

  set token(String value) {
    _token = value;
    notifyListeners();
  }
}
