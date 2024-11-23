// 🎯 Dart imports:
import 'dart:async';
import 'dart:io';

// 📦 Package imports:
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

// 🌎 Project imports:
import 'package:ecommerce_elevate/core/datasource_execution/app_exception.dart';
import 'package:ecommerce_elevate/core/datasource_execution/results.dart';

@singleton
class DataSourceExecution {
  Future<Results<T>> execute<T>(Future<T> Function() apiCall) async {
    try {
      var response = await apiCall();
      return Success<T>(response);
    } on SocketException catch (e) {
      return Failure<T>(e);
    } on TimeoutException catch (e) {
      return Failure<T>(e);
    } on HttpException catch (e) {
      return Failure<T>(e);
    } on DioException catch (e) {
      return Failure<T>(e);
    } on FormatException catch (e) {
      return Failure<T>(e);
    } on IOException {
      return Failure<T>(InternetConnectionException());
    } catch (e) {
      return Failure<T>(e as Exception);
    }
  }
}
