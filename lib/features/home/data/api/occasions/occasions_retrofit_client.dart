import 'package:dio/dio.dart';
import 'package:ecommerce_elevate/core/constants/api_constants.dart';
import 'package:ecommerce_elevate/features/home/data/models/occasions/occasions_response_dto.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';

part 'occasions_retrofit_client.g.dart';

@singleton
@RestApi(baseUrl: ApiConstants.baseUrl)
abstract class OccasionsRetrofitClient {
  @factoryMethod
  factory OccasionsRetrofitClient(Dio dio) = _OccasionsRetrofitClient;

  @GET(ApiConstants.occasionsRoute)
  Future<OccasionResponseDto> getOccasionsList();
}
