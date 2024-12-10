import 'package:ecommerce_elevate/core/datasource_execution/results.dart';
import 'package:ecommerce_elevate/domain/entities/edit_profile/edit_profile_request.dart';
import 'package:ecommerce_elevate/domain/entities/edit_profile/edit_profile_response.dart';
import 'package:ecommerce_elevate/domain/repository/auth_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class EditProfileUseCase {
  final AuthRepository _authRepository;

  EditProfileUseCase(this._authRepository);

  Future<Results<EditProfileResponse>> call(
          {required EditProfileRequest request}) async =>
      await _authRepository.editProfile(request);
}
