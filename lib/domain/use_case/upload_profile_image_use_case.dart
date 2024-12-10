import 'dart:io';

import 'package:dio/dio.dart';
import 'package:ecommerce_elevate/core/datasource_execution/results.dart';
import 'package:ecommerce_elevate/domain/repository/auth_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class UploadProfileImageUseCase {
  final AuthRepository _authRepository;

  UploadProfileImageUseCase(this._authRepository);

  Future<Results<String>> call({required FormData imageFile}) async =>
      await _authRepository.uploadProfileImage(imageFile);
}
