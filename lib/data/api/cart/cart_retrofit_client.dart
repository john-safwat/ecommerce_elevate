// 📦 Package imports:
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';

// 🌎 Project imports:
import 'package:ecommerce_elevate/core/constants/api_constants.dart';
import 'package:ecommerce_elevate/data/models/cart/add_to_cart/request/add_to_cart_request_dto.dart';
import 'package:ecommerce_elevate/data/models/cart/add_to_cart/response/add_to_cart_response_dto.dart';
import 'package:ecommerce_elevate/data/models/cart/card_data/user_cart_response_dto.dart';
import 'package:ecommerce_elevate/data/models/cart/delete_product_cart/delete_product_response_dto.dart';

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

  @GET(ApiConstants.cartRoute)
  Future<UserCartResponseDto> getUserCart(
      @Header("Authorization") String token);

  @PUT("${ApiConstants.cartRoute}/{id}")
  Future<UserCartResponseDto> updateCart(@Header("Authorization") String token,
      @Path("id") String id, @Body() Map<String, int> body);

  @DELETE("${ApiConstants.cartRoute}/{id}")
  Future<DeleteProductsResponseDto> deleteCartProduct(
      @Header("Authorization") String token, @Path("id") String id);
}
