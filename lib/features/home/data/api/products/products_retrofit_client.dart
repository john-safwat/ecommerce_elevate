// 📦 Package imports:
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';

// 🌎 Project imports:
import 'package:ecommerce_elevate/core/constants/api_constants.dart';
import 'package:ecommerce_elevate/features/home/data/models/products/best_seller_response_dto.dart';

part 'products_retrofit_client.g.dart';

@singleton
@RestApi(baseUrl: ApiConstants.baseUrl)
abstract class ProductsRetrofitClient {
  @factoryMethod
  factory ProductsRetrofitClient(Dio dio) = _ProductsRetrofitClient;

  @GET(ApiConstants.bestSellerRoute)
  Future<BestSellerResponseDto> getBestSellerList();
}
