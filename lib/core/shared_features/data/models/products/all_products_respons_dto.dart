// 📦 Package imports:
import 'package:json_annotation/json_annotation.dart';


// 🌎 Project imports:
import 'product_dto.dart';

part 'all_products_respons_dto.g.dart';

@JsonSerializable()
class AllProductsResponsDto {
  @JsonKey(name: "message")
  final String? message;
  @JsonKey(name: "products")
  final List<ProductDto>? products;

  AllProductsResponsDto({
    this.message,
    this.products,
  });

  factory AllProductsResponsDto.fromJson(Map<String, dynamic> json) {
    return _$AllProductsResponsDtoFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$AllProductsResponsDtoToJson(this);
  }
}
