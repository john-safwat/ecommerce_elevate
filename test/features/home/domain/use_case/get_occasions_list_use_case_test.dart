import 'package:ecommerce_elevate/core/datasource_execution/results.dart';
import 'package:ecommerce_elevate/features/home/domain/entities/occasions/occasion.dart';
import 'package:ecommerce_elevate/features/home/domain/repository/occasions_repository.dart';
import 'package:ecommerce_elevate/features/home/domain/use_case/get_occasions_list_use_case.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../../../core/di/di_test.dart';
import 'get_occasions_list_use_case_test.mocks.dart';

@GenerateMocks([OccasionsRepository])
void main() async {

  await dependenciesSetup();

  group("Occasion Repository Test", () {
    test('should return a non-empty occasions list on successful datasource call', () async {
      var mockRepository = getItTest<MockOccasionsRepository>();
      var useCase = GetOccasionsListUseCase(mockRepository);

      final mockOccasions = [
        Occasion(id: '1', name: 'Electronics'),
        Occasion(id: '2', name: 'Clothing'),
      ];

      var result = Success<List<Occasion>?>(mockOccasions);
      provideDummy<Results<List<Occasion>?>>(result);
      when(mockRepository.getOccasionsList()).thenAnswer((_) async => result);
      final actualResult = await useCase();

      expect(actualResult, result);
      expect(result.data, isNotNull);
      expect(result.data!.length, equals(2));
      expect(result.data![0].name, equals('Electronics'));
    });

    test('Failure during the API call.', () async {
      var mockRepository = getItTest<MockOccasionsRepository>();
      var useCase = GetOccasionsListUseCase(mockRepository);

      var result = Failure<List<Occasion>?>(Exception());
      provideDummy<Results<List<Occasion>?>>(result);
      when(mockRepository.getOccasionsList()).thenAnswer((_) async => result);

      final actualResult = await useCase();

      expect(actualResult, result);
      expect(result.exception, isException);
    });

  });

}