// 📦 Package imports:

// 🌎 Project imports:
import 'package:ecommerce_elevate/core/datasource_execution/results.dart';
import 'package:ecommerce_elevate/data/datasource/contract/occasions_remote_datasource.dart';
import 'package:ecommerce_elevate/domain/entities/occasions/occasion.dart';
import 'package:ecommerce_elevate/domain/repository/occasions_repository.dart';
// 📦 Package imports:
import 'package:injectable/injectable.dart';

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
