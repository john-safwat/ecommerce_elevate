// 📦 Package imports:

// 🌎 Project imports:
import 'package:ecommerce_elevate/core/constants/constants.dart';
import 'package:ecommerce_elevate/core/providers/app_config_provider.dart';
import 'package:ecommerce_elevate/core/providers/language_provider.dart';
// 📦 Package imports:
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

@lazySingleton
class AppInitializer {
  LanguageProvider languageProvider;
  AppConfigProvider appConfigProvider;
  SharedPreferences preferences;

  AppInitializer(
      this.languageProvider, this.appConfigProvider, this.preferences);

  init() {
    _initialLocale();
    _initialUserData();
  }

  _initialLocale() {
    var locale = preferences.getString(Constants.localeKey) ??
        Constants.englishLocaleKey;
    languageProvider.changeLocale(locale);
  }

  _initialUserData() {
    var token = preferences.getString(Constants.tokenKey) ?? "";
    appConfigProvider.token = token;
    return appConfigProvider.token.isEmpty;
  }
}
