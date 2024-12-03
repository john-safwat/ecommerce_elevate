// 📦 Package imports:

// 🌎 Project imports:
import 'package:ecommerce_elevate/core/datasource_execution/results.dart';
import 'package:ecommerce_elevate/features/home/domain/entities/occasions/occasion.dart';
import 'package:ecommerce_elevate/features/home/domain/repository/occasions_repository.dart';
import 'package:injectable/injectable.dart';
import 'package:ecommerce_elevate/core/shared_features/domain/entities/occasions/occasion.dart';
import 'package:ecommerce_elevate/core/shared_features/domain/repository/occasions_repository.dart';
// 📦 Package imports:
import 'package:injectable/injectable.dart';

@injectable
class GetOccasionsListUseCase {
  OccasionsRepository repository;

  GetOccasionsListUseCase(this.repository);

  Future<Results<List<Occasion>?>> call() async =>
      repository.getOccasionsList();
}
