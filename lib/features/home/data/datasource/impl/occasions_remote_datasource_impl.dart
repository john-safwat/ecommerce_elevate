import 'package:ecommerce_elevate/core/datasource_execution/results.dart';
import 'package:ecommerce_elevate/features/home/data/api/occasions/occasions_retrofit_client.dart';
import 'package:ecommerce_elevate/features/home/data/datasource/contract/occasions_remote_datasource.dart';
import 'package:ecommerce_elevate/features/home/domain/entities/occasions/occasion.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/datasource_execution/datasource_execution.dart';

@Injectable(as: OccasionsRemoteDatasource)
class OccasionsDatasourceImpl implements OccasionsRemoteDatasource {
  final OccasionsRetrofitClient _occasionsRetrofitClient;
  final DataSourceExecution _apiExecution;

  OccasionsDatasourceImpl(this._occasionsRetrofitClient, this._apiExecution);

  @override
  Future<Results<List<Occasion>?>> getOccasionsList() async {
    var response = await _apiExecution.execute<List<Occasion>?>(() async {
      var result = await _occasionsRetrofitClient.getOccasionsList();
      return result.occasions
          ?.map(
            (e) => e.toDomain(),
          )
          .toList();
    });
    return response;
  }
}
