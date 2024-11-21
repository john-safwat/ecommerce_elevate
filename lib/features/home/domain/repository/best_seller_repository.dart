import 'package:ecommerce_elevate/core/datasource_execution/results.dart';
import 'package:ecommerce_elevate/features/home/domain/entities/best_seller/best_seller.dart';
import 'package:ecommerce_elevate/features/home/domain/entities/cateogry/Categories.dart';
import 'package:ecommerce_elevate/features/home/domain/entities/occasions/occasions.dart';

abstract class BestSellerRepository {
  Future<Results<List<BestSeller>?>> getBestSellerList ();

}