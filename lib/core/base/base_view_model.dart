// 🎯 Dart imports:
import 'dart:async';
import 'dart:io';

//  Package imports:
import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
// 🌎 Project imports:
import 'package:ecommerce_elevate/core/providers/app_config_provider.dart';
import 'package:ecommerce_elevate/core/providers/language_provider.dart';
// 🐦 Flutter imports:
import 'package:flutter/cupertino.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

abstract class BaseViewModel<T, E extends BaseAction> extends Cubit<T> {
  BaseViewModel(super.initialState);

  LanguageProvider? languageProvider;
  AppConfigProvider? appConfigProvider;
  AppLocalizations? locale;
  Size? mediaQuery;

  Future<void> doIntent(E action);

  String mapExceptionToMessage(Exception exception) {
    if (exception is SocketException) {
      return locale!.socketExceptionMessage;
    } else if (exception is TimeoutException) {
      return locale!.timeoutExceptionMessage;
    } else if (exception is HttpException) {
      return locale!.httpExceptionMessage;
    } else if (exception is DioException) {
      switch (exception.type) {
        case DioExceptionType.connectionTimeout:
          return locale!.dioConnectionTimeoutMessage;
        case DioExceptionType.sendTimeout:
          return locale!.dioSendTimeoutMessage;
        case DioExceptionType.receiveTimeout:
          return locale!.dioReceiveTimeoutMessage;
        case DioExceptionType.badCertificate:
          return locale!.dioBadCertificateMessage;
        case DioExceptionType.badResponse:
          return exception.response?.data["error"] ??
              locale!.dioBadResponseMessage;
        case DioExceptionType.cancel:
          return locale!.dioCancelMessage;
        case DioExceptionType.connectionError:
          return locale!.dioConnectionErrorMessage;
        case DioExceptionType.unknown:
          return locale!.dioUnknownMessage;
      }
    } else if (exception is FormatException) {
      return locale!.formatExceptionMessage;
    } else if (exception is IOException) {
      return locale!.ioExceptionMessage;
    } else {
      return locale!.dioDefaultMessage;
    }
  }
}

abstract class BaseAction {}
