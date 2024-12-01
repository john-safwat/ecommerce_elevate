// 📦 Package imports:
import 'package:ecommerce_elevate/core/shared_features/data/api/occasions/occasions_retrofit_client.dart';
import 'package:ecommerce_elevate/core/shared_features/data/datasource/contract/occasions_remote_datasource.dart';
import 'package:injectable/injectable.dart';

// 🌎 Project imports:
import 'package:ecommerce_elevate/core/datasource_execution/results.dart';
import '../../../../../core/datasource_execution/datasource_execution.dart';
import '../../../domain/entities/occasions/occasion.dart';

@Injectable(as: OccasionsRemoteDatasource)
class OccasionsRemoteDatasourceImpl implements OccasionsRemoteDatasource {
  final OccasionsRetrofitClient _occasionsRetrofitClient;
  final DataSourceExecution _apiExecution;

  OccasionsRemoteDatasourceImpl(this._occasionsRetrofitClient, this._apiExecution);

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
