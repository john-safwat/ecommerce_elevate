// 🐦 Flutter imports:

// 🌎 Project imports:
import 'package:ecommerce_elevate/core/providers/app_config_provider.dart';
import 'package:ecommerce_elevate/core/providers/language_provider.dart';
import 'package:ecommerce_elevate/core/utils/app_initializer.dart';
// 🐦 Flutter imports:
import 'package:ecommerce_elevate/features/about_us/about_us_view.dart';
import 'package:ecommerce_elevate/features/address/address_view.dart';
import 'package:ecommerce_elevate/features/best_seller/presentation/best_seller_view.dart';
import 'package:ecommerce_elevate/features/change_password/change_password_view.dart';
import 'package:ecommerce_elevate/features/forget_password/forget_password_view.dart';
import 'package:ecommerce_elevate/features/home/home_view.dart';
import 'package:ecommerce_elevate/features/login/login_view.dart';
import 'package:ecommerce_elevate/features/occasions/occasions_screen.dart';
import 'package:ecommerce_elevate/features/otp_verify/otp_verify_view.dart';
import 'package:ecommerce_elevate/features/product_details/presentation/product_details_view.dart';
import 'package:ecommerce_elevate/features/reset_password/reset_password_view.dart';
import 'package:ecommerce_elevate/features/signup/signup_view.dart';
// 🐦 Flutter imports:
import 'package:ecommerce_elevate/features/terms_and_conditions/terms_and_conditions_view.dart';
import 'package:flutter/material.dart';
// 📦 Package imports:
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:provider/provider.dart';

import 'core/constants/routes.dart';
import 'core/di/di.dart';
import 'core/theme/app_theme.dart';

void main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  await configureDependencies();
  getIt<AppInitializer>().init();
  FlutterNativeSplash.remove();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<LanguageProvider>(
            create: (context) => getIt<LanguageProvider>()),
        ChangeNotifierProvider<AppConfigProvider>(
            create: (context) => getIt<AppConfigProvider>()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    var localProvider = Provider.of<LanguageProvider>(context);
    var appConfigProvider = Provider.of<AppConfigProvider>(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.appTheme,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      locale: Locale(localProvider.getLocal()),
      routes: {
        Routes.loginRoute: (context) => const LoginView(),
        Routes.signupRoute: (context) => const SignupView(),
        Routes.homeRoute: (_) => const HomeView(),
        Routes.forgetPasswordRoute: (context) => const ForgetPasswordView(),
        Routes.otpVerifyRoute: (context) => const OtpVerifyView(),
        Routes.resetPasswordViewRoute: (context) => const ResetPasswordView(),
        Routes.occasionsRoute: (context) => const OccasionsScreen(),
        Routes.productDetailsRoute: (context) => const ProductDetailsView(),
        Routes.bestSellerViewRoute: (context) => const BestSellerView(),
        Routes.changePasswordRoute: (context) => const ChangePasswordView(),
        Routes.aboutUsRoute: (context) => const AboutUsView(),
        Routes.termsAndCondtionsRoute: (context) => const TermsAndConditionsView(),
        Routes.addressesRoute: (context) => const AddressView(),
      },
      initialRoute: appConfigProvider.token.isEmpty
          ? Routes.loginRoute
          : Routes.homeRoute,
    );
  }
}
