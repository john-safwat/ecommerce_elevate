// 📦 Package imports:
import 'package:dio/dio.dart';
// 🌎 Project imports:
import 'package:ecommerce_elevate/core/constants/api_constants.dart';
import 'package:ecommerce_elevate/data/models/logout/logout_response_dto.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';

part 'logout_retrofit_client.g.dart';

@singleton
@RestApi(baseUrl: ApiConstants.baseUrl)
abstract class LogoutRetrofitClient {
  @factoryMethod
  factory LogoutRetrofitClient(Dio dio) = _LogoutRetrofitClient;

  @GET(ApiConstants.logoutRoute)
  Future<LogoutResponseDto> logoutUser({
    @Header('Authorization') String? token,
  });
}
