import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

@singleton
class AppConfigProvider extends ChangeNotifier {
  String _token = "";
  String _email = "";
  bool _isGuest = false;

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
  bool get isGuest => _isGuest;

  set isGuest(bool value) {
    _isGuest = value;
    notifyListeners();
  }

}
