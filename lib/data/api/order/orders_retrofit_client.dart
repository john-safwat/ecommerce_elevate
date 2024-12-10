import 'package:dio/dio.dart';
import 'package:ecommerce_elevate/core/constants/api_constants.dart';
import 'package:ecommerce_elevate/data/models/orders/create_order/request/create_cache_order_request_dto.dart';
import 'package:ecommerce_elevate/data/models/orders/create_order/response/create_cache_order_response_dto.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';

part 'orders_retrofit_client.g.dart';

@singleton
@RestApi(baseUrl: ApiConstants.baseUrl)
abstract class OrdersRetrofitClient {
  @factoryMethod
  factory OrdersRetrofitClient(Dio dio) = _OrdersRetrofitClient;

  @POST(ApiConstants.addCacheOrderRoute)
  Future<CreateCacheOrderResponseDto> crateCacheOrder(
      @Body() CreateCacheOrderRequestDto request,
      @Header('Authorization') String? token);
}
