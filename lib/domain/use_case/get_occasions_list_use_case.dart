// 📦 Package imports:

// 📦 Package imports:
import 'package:injectable/injectable.dart';

// 🌎 Project imports:
import 'package:ecommerce_elevate/core/datasource_execution/results.dart';
import 'package:ecommerce_elevate/domain/entities/occasions/occasion.dart';
import 'package:ecommerce_elevate/domain/repository/occasions_repository.dart';

@injectable
class GetOccasionsListUseCase {
  OccasionsRepository repository;

  GetOccasionsListUseCase(this.repository);

  Future<Results<List<Occasion>?>> call() async =>
      repository.getOccasionsList();
}