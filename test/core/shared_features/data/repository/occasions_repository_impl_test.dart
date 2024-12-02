// 📦 Package imports:
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

// 🌎 Project imports:
import 'package:ecommerce_elevate/core/datasource_execution/results.dart';
import 'package:ecommerce_elevate/core/shared_features/data/datasource/contract/occasions_remote_datasource.dart';
import 'package:ecommerce_elevate/core/shared_features/data/repository/occasions_repository_impl.dart';
import 'package:ecommerce_elevate/core/shared_features/domain/entities/occasions/occasion.dart';
import '../../../../core/di/di_test.dart';
import 'occasions_repository_impl_test.mocks.dart';

@GenerateMocks([OccasionsRemoteDatasource])
void main() async {

  await dependenciesSetup();

  group("Occasion Repository Test", () {
    test('should return a non-empty occasions list on successful datasource call', () async {
      var mockDatasource = getItTest<MockOccasionsRemoteDatasource>();
      var repository = OccasionsRepositoryImpl(mockDatasource);

      final mockOccasions = [
        Occasion(id: '1', name: 'Electronics'),
        Occasion(id: '2', name: 'Clothing'),
      ];

      var result = Success<List<Occasion>?>(mockOccasions);
      provideDummy<Results<List<Occasion>?>>(result);
      when(mockDatasource.getOccasionsList()).thenAnswer((_) async => result);
      final actualResult = await repository.getOccasionsList();

      expect(actualResult, result);
      expect(result.data, isNotNull);
      expect(result.data!.length, equals(2));
      expect(result.data![0].name, equals('Electronics'));
    });

    test('Failure during the API call.', () async {
      var mockDatasource = getItTest<MockOccasionsRemoteDatasource>();
      var repository = OccasionsRepositoryImpl(mockDatasource);

      var result = Failure<List<Occasion>?>(Exception());
      provideDummy<Results<List<Occasion>?>>(result);
      when(mockDatasource.getOccasionsList()).thenAnswer((_) async => result);

      final actualResult = await repository.getOccasionsList();

      expect(actualResult, result);
      expect(result.exception, isException);
    });

  });

}
