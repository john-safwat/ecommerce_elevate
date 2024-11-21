import 'package:dio/dio.dart';
import 'package:ecommerce_elevate/core/constants/api_constants.dart';
import 'package:ecommerce_elevate/features/home/data/models/best_seller/response/best_seller_response_dto.dart';
import 'package:ecommerce_elevate/features/home/data/models/cateogry/response/categories_response_dto.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';

part 'best_seller_retrofit_client.g.dart';

@singleton
@RestApi(baseUrl: ApiConstants.baseUrl)
abstract class BestSellerRetrofitClient {
  @factoryMethod
  factory BestSellerRetrofitClient(Dio dio) = _BestSellerRetrofitClient;

  @GET(ApiConstants.bestSellerRoute)
  Future<BestSellerResponseDto> getBestSellerList();


}
