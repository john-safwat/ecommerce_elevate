// 📦 Package imports:
import 'package:ecommerce_elevate/core/shared_features/data/datasource/contract/occasions_remote_datasource.dart';
import 'package:ecommerce_elevate/core/shared_features/domain/entities/occasions/occasion.dart';
import 'package:ecommerce_elevate/core/shared_features/domain/repository/occasions_repository.dart';
import 'package:injectable/injectable.dart';

// 🌎 Project imports:
import 'package:ecommerce_elevate/core/datasource_execution/results.dart';

@Injectable(as: OccasionsRepository)
class OccasionsRepositoryImpl implements OccasionsRepository {
  final OccasionsRemoteDatasource _datasource;

  OccasionsRepositoryImpl(this._datasource);

  @override
  Future<Results<List<Occasion>?>> getOccasionsList() {
    var response = _datasource.getOccasionsList();
    return response;
  }
}
