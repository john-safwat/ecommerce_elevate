import 'package:ecommerce_elevate/core/datasource_execution/results.dart';
import 'package:ecommerce_elevate/features/home/domain/entities/occasions/occasions.dart';

abstract class OccasionsDatasource{
  Future<Results<List<Occasions>?>> getOccasionsList();
}