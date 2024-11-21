import 'package:ecommerce_elevate/features/home/domain/entities/occasions/occasions.dart';
import 'package:ecommerce_elevate/features/home/domain/repository/occasions_repository.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/datasource_execution/results.dart';
@injectable
class OccasionsUseCase {
  final OccasionsRepository _repository;
  OccasionsUseCase(this._repository);
  Future<Results<List<Occasions>?>> call() async =>
      await _repository.getOccasionsList();





}