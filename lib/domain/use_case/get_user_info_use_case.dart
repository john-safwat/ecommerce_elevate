import 'package:ecommerce_elevate/domain/repository/auth_repository.dart';
import 'package:ecommerce_elevate/features/auth/domain/entities/user_info/user_info_response.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/datasource_execution/results.dart';

@injectable
class GetUserInfoUseCase {
  final AuthRepository _authRepository;

  GetUserInfoUseCase(this._authRepository);

  Future<Results<GetUserInfoResponse>> call({required String token}) async =>
      await _authRepository.getUserInfo(token);
}
