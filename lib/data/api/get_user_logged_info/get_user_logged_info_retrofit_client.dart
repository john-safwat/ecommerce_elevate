// 📦 Package imports:
import 'package:dio/dio.dart';
// 🌎 Project imports:
import 'package:ecommerce_elevate/core/constants/api_constants.dart';
import 'package:ecommerce_elevate/data/models/profile_info/profile_response_dto.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';

part 'get_user_logged_info_retrofit_client.g.dart';

@singleton
@RestApi(baseUrl: ApiConstants.baseUrl)
abstract class GetUserLoggedInfoRetrofitClient {
  @factoryMethod
  factory GetUserLoggedInfoRetrofitClient(Dio dio) =
      _GetUserLoggedInfoRetrofitClient;

  @GET(ApiConstants.profileDataRoute)
  Future<ProfileResponseDto> getLoggedUserInfo(
      {@Header('Authorization') String? token});
}
