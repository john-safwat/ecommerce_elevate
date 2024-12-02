import 'package:dio/dio.dart';
import 'package:ecommerce_elevate/core/constants/api_constants.dart';
import 'package:ecommerce_elevate/core/shared_features/data/models/cart/add_to_cart/request/add_to_cart_request_dto.dart';
import 'package:ecommerce_elevate/core/shared_features/data/models/cart/add_to_cart/response/add_to_cart_response_dto.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';

part 'cart_retrofit_client.g.dart';

@singleton
@RestApi(baseUrl: ApiConstants.baseUrl)
abstract class CartRetrofitClient {
  @factoryMethod
  factory CartRetrofitClient(Dio dio) = _CartRetrofitClient;

  @POST(ApiConstants.cartRoute)
  Future<AddToCartResponseDto> addItemToCart(
      @Body() AddToCartRequestDto addToCartRequestDto,
      @Header("Authorization") String token);
}
