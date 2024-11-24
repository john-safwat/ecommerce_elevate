import 'package:ecommerce_elevate/core/datasource_execution/results.dart';
import 'package:ecommerce_elevate/features/home/domain/entities/products/product.dart';

abstract interface class ProductsDatasource{
  Future<Results<List<Product>?>> getBestSellerList();
}