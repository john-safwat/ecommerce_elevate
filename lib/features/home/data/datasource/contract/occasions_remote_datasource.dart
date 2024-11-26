import 'package:ecommerce_elevate/core/datasource_execution/results.dart';
import 'package:ecommerce_elevate/features/home/domain/entities/occasions/occasion.dart';

abstract class OccasionsRemoteDatasource{
  Future<Results<List<Occasion>?>> getOccasionsList();
}