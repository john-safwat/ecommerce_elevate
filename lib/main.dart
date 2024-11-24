import 'package:ecommerce_elevate/core/providers/app_config_provider.dart';
import 'package:ecommerce_elevate/core/providers/language_provider.dart';
import 'package:ecommerce_elevate/core/utils/app_initializer.dart';
import 'package:ecommerce_elevate/features/auth/presentation/forget_password/forget_password_view.dart';
import 'package:ecommerce_elevate/features/auth/presentation/login/login_view.dart';
import 'package:ecommerce_elevate/features/auth/presentation/otp_verify/otp_verify_view.dart';
import 'package:ecommerce_elevate/features/auth/presentation/reset_password/reset_password_view.dart';
import 'package:ecommerce_elevate/features/auth/presentation/signup/signup_view.dart';
import 'package:ecommerce_elevate/features/home/best_seller/presentation/best_seller_view.dart';
import 'package:ecommerce_elevate/features/home/home_view.dart';
import 'package:flutter/material.dart';
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
        Routes.bestSellerViewRoute: (context) => const BestSellerView(),
      },
      initialRoute: appConfigProvider.token.isEmpty
          ? Routes.loginRoute
          : Routes.homeRoute,
    );
  }
}
