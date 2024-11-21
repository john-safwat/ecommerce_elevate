import 'package:ecommerce_elevate/core/datasource_execution/results.dart';
import 'package:ecommerce_elevate/features/home/data/api/occasions/occasions_retrofit_client.dart';
import 'package:ecommerce_elevate/features/home/data/datasource/contract/occasions_datasource.dart';
import 'package:ecommerce_elevate/features/home/domain/entities/occasions/occasions.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/datasource_execution/datasource_execution.dart';

@Injectable(as: OccasionsDatasource)
class OccasionsDatasourceImpl extends OccasionsDatasource {
  final OccasionsRetrofitClient _occasionsRetrofitClient;
  final DataSourceExecution _apiExecution;

  OccasionsDatasourceImpl(this._occasionsRetrofitClient, this._apiExecution);

  @override
  Future<Results<List<Occasions>?>> getOccasionsList() async{
    var response = await _apiExecution.execute<List<Occasions>?>(() async {
      var result = await _occasionsRetrofitClient.getOccasionsList();
      var occasions = result.occasions?.map((e) => e.toDomain(),).toList();
      return occasions;
    });
    return response;
  }


}
