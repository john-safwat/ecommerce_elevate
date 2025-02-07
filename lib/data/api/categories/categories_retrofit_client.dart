// 📦 Package imports:
import 'package:dio/dio.dart';
// 🌎 Project imports:
import 'package:ecommerce_elevate/core/constants/api_constants.dart';
import 'package:ecommerce_elevate/data/models/categories/categories_response_dto.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';

part 'categories_retrofit_client.g.dart';

@singleton
@RestApi(baseUrl: ApiConstants.baseUrl)
abstract class CategoriesRetrofitClient {
  @factoryMethod
  factory CategoriesRetrofitClient(Dio dio) = _CategoriesRetrofitClient;

  @GET(ApiConstants.categoriesRoute)
  Future<CategoriesResponseDto> getCategoriesList();
}
