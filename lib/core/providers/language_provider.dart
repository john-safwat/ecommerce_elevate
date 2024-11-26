// 🐦 Flutter imports:
import 'package:flutter/cupertino.dart';

// 📦 Package imports:
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

// 🌎 Project imports:
import 'package:ecommerce_elevate/core/constants/constants.dart';

@singleton
class LanguageProvider extends ChangeNotifier {
  // set the default local
  String _currentLocale = Constants.englishLocaleKey;
  SharedPreferences sharedPreferences;

  LanguageProvider(this.sharedPreferences);

  // function to change the local with new local and set it in
  Future<void> changeLocale(String newLocale) async {
    // if the new local is the same this condition will terminate
    if (newLocale == _currentLocale) {
      return;
    }
    _currentLocale = newLocale;
    sharedPreferences.setString(Constants.localeKey, _currentLocale);

    // notify all listeners on the theme values
    notifyListeners();
  }

  // if the language is english
  bool isEn() {
    return _currentLocale == Constants.englishLocaleKey;
  }

  // function to return the local
  String getLocal() {
    return _currentLocale;
  }
}
