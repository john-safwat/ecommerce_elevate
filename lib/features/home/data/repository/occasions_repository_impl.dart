import 'package:ecommerce_elevate/core/datasource_execution/results.dart';
import 'package:ecommerce_elevate/features/home/data/datasource/contract/occasions_datasource.dart';
import 'package:ecommerce_elevate/features/home/domain/entities/occasions/occasions.dart';
import 'package:ecommerce_elevate/features/home/domain/repository/occasions_repository.dart';
import 'package:injectable/injectable.dart';

@Injectable(as:OccasionsRepository )
class OccasionsRepositoryImpl extends OccasionsRepository {
  final OccasionsDatasource _datasource;

  OccasionsRepositoryImpl(this._datasource);

  @override
  Future<Results<List<Occasions>?>> getOccasionsList() {
   var response = _datasource.getOccasionsList();
   return response;
  }

}