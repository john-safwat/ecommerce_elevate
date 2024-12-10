// 📦 Package imports:
import 'package:dio/dio.dart';
// 🌎 Project imports:
import 'package:ecommerce_elevate/core/datasource_execution/app_exception.dart';
import 'package:ecommerce_elevate/core/datasource_execution/results.dart';
import 'package:ecommerce_elevate/data/api/occasions/occasions_retrofit_client.dart';
import 'package:ecommerce_elevate/data/datasource/impl/occasions_remote_datasource_impl.dart';
import 'package:ecommerce_elevate/domain/entities/occasions/occasion.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../../core/datasource_execution/mock_datasource_execution.dart';
import '../../../core/di/di_test.dart';
import 'occasions_remote_datasource_impl_test.mocks.dart';

@GenerateMocks([OccasionsRetrofitClient])
void main() async {
  await dependenciesSetup();

  group("Occasions Remote Datasource", () {
    test("Successful response with non-empty occasions list.", () async {
      var datasourceExecution = getItTest<MockDataSourceExecution>();
      var occasionsRetrofitClient = getItTest<MockOccasionsRetrofitClient>();
      var remoteDataSource = OccasionsRemoteDatasourceImpl(
        occasionsRetrofitClient,
        datasourceExecution,
      );

      var result = Success<List<Occasion>?>([
        Occasion(),
        Occasion(),
        Occasion(),
      ]);
      provideDummy<Results<List<Occasion>?>>(result);

      when(datasourceExecution.execute<List<Occasion>?>(any))
          .thenAnswer((_) async => result);

      var actualResult = await remoteDataSource.getOccasionsList();

      expect(actualResult, result);
      expect((actualResult as Success<List<Occasion>?>).data, isNotEmpty);
    });

    test("Successful response with an empty occasions list.", () async {
      var datasourceExecution = getItTest<MockDataSourceExecution>();
      var occasionsRetrofitClient = getItTest<MockOccasionsRetrofitClient>();
      var remoteDataSource = OccasionsRemoteDatasourceImpl(
        occasionsRetrofitClient,
        datasourceExecution,
      );

      var result = Success<List<Occasion>?>([]);
      provideDummy<Results<List<Occasion>?>>(result);

      when(datasourceExecution.execute<List<Occasion>?>(any))
          .thenAnswer((_) async => result);

      var actualResult = await remoteDataSource.getOccasionsList();

      expect(actualResult, result);
      expect((actualResult as Success<List<Occasion>?>).data, isEmpty);
    });

    test("Successful response with null occasion field.", () async {
      var datasourceExecution = getItTest<MockDataSourceExecution>();
      var occasionsRetrofitClient = getItTest<MockOccasionsRetrofitClient>();
      var remoteDataSource = OccasionsRemoteDatasourceImpl(
        occasionsRetrofitClient,
        datasourceExecution,
      );

      var result = Success<List<Occasion>?>(null);
      provideDummy<Results<List<Occasion>?>>(result);

      when(datasourceExecution.execute<List<Occasion>?>(any))
          .thenAnswer((_) async => result);

      var actualResult = await remoteDataSource.getOccasionsList();

      expect(actualResult, result);
      expect((actualResult as Success<List<Occasion>?>).data, isNull);
    });

    test("Failure during the API call.", () async {
      var datasourceExecution = getItTest<MockDataSourceExecution>();
      var occasionsRetrofitClient = getItTest<MockOccasionsRetrofitClient>();
      var remoteDataSource = OccasionsRemoteDatasourceImpl(
        occasionsRetrofitClient,
        datasourceExecution,
      );

      var result = Failure<List<Occasion>?>(Exception());
      provideDummy<Results<List<Occasion>?>>(result);

      when(datasourceExecution.execute<List<Occasion>?>(any))
          .thenAnswer((_) async => result);

      var actualResult = await remoteDataSource.getOccasionsList();

      expect(actualResult, result);
    });

    test("Network error while fetching data.", () async {
      var datasourceExecution = getItTest<MockDataSourceExecution>();
      var occasionsRetrofitClient = getItTest<MockOccasionsRetrofitClient>();
      var remoteDataSource = OccasionsRemoteDatasourceImpl(
        occasionsRetrofitClient,
        datasourceExecution,
      );

      var result = Failure<List<Occasion>?>(
        ServerError("There Are Network Error", 500),
      );
      provideDummy<Results<List<Occasion>?>>(result);

      when(datasourceExecution.execute<List<Occasion>?>(any))
          .thenAnswer((_) async => result);

      var actualResult = await remoteDataSource.getOccasionsList();

      expect(actualResult, result);
      expect((actualResult as Failure<List<Occasion>?>).exception, isException);
      expect((actualResult).exception, isA<ServerError>());
    });

    test("API call takes an extended time.", () async {
      var datasourceExecution = getItTest<MockDataSourceExecution>();
      var occasionsRetrofitClient = getItTest<MockOccasionsRetrofitClient>();
      var remoteDataSource = OccasionsRemoteDatasourceImpl(
        occasionsRetrofitClient,
        datasourceExecution,
      );

      var result = Failure<List<Occasion>?>(
        DioException(
            type: DioExceptionType.connectionTimeout,
            requestOptions: RequestOptions()),
      );
      provideDummy<Results<List<Occasion>?>>(result);

      when(datasourceExecution.execute<List<Occasion>?>(any))
          .thenAnswer((_) async => result);

      var actualResult = await remoteDataSource.getOccasionsList();

      expect(actualResult, result);
      expect(
        ((actualResult as Failure<List<Occasion>?>).exception as DioException)
            .type,
        equals(DioExceptionType.connectionTimeout),
      );
    });
  });
}
