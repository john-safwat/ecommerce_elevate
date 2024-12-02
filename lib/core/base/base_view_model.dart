// 🎯 Dart imports:
import 'dart:async';
import 'dart:io';

// 📦 Package imports:
import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:ecommerce_elevate/core/datasource_execution/results.dart';
import 'package:ecommerce_elevate/core/di/di.dart';
// 🌎 Project imports:
import 'package:ecommerce_elevate/core/providers/app_config_provider.dart';
import 'package:ecommerce_elevate/core/providers/language_provider.dart';
import 'package:ecommerce_elevate/core/shared_features/domain/entities/cart/request/add_to_cart_request.dart';
import 'package:ecommerce_elevate/core/shared_features/domain/entities/cart/response/add_to_cart_response.dart';
import 'package:ecommerce_elevate/core/shared_features/domain/use_case/add_item_to_cart_use_case.dart';
import 'package:ecommerce_elevate/core/utils/app_dialogs.dart';
// 🐦 Flutter imports:
import 'package:flutter/cupertino.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

abstract class BaseViewModel<T, E extends BaseAction> extends Cubit<T> {
  BaseViewModel(super.initialState);

  LanguageProvider? languageProvider;
  AppConfigProvider? appConfigProvider;
  AppLocalizations? locale;
  Size? mediaQuery;

  final AddItemToCartUseCase _addItemToCartUseCase =
      getIt<AddItemToCartUseCase>();

  Future<void> doIntent(E action);

  Future<void> addProductToCart(
      AddToCartRequest addToCartRequest, T loadingState) async {
    if(appConfigProvider!.token.isEmpty){
      AppDialogs.showErrorToast(locale!.notLoggedIn);
      return;
    }
    emit(loadingState);
    var response = await _addItemToCartUseCase(
        addToCartRequest, "Bearer ${appConfigProvider!.token}");
    switch (response) {
      case Success<AddToCartResponse>():
        {
          AppDialogs.showSuccessToast(locale!.addedToCartSuccessfully);
        }
      case Failure<AddToCartResponse>():
        {
          AppDialogs.showErrorToast(mapExceptionToMessage(response.exception));
        }
    }

  }

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
          return locale!.dioBadResponseMessage;
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
