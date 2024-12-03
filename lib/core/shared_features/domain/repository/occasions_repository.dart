// 🌎 Project imports:
import 'package:ecommerce_elevate/core/datasource_execution/results.dart';
import 'package:ecommerce_elevate/core/shared_features/domain/entities/occasions/occasion.dart';

abstract interface class OccasionsRepository {
  Future<Results<List<Occasion>?>> getOccasionsList();
}
