// 📦 Package imports:
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

// 🌎 Project imports:
import 'package:ecommerce_elevate/core/datasource_execution/datasource_execution.dart';
import 'package:ecommerce_elevate/core/datasource_execution/results.dart';
import 'package:ecommerce_elevate/features/auth/data/api/auth_retrofit_client.dart';
import 'package:ecommerce_elevate/features/auth/data/datasource/impl/auth_remote_datasource_impl.dart';
import 'package:ecommerce_elevate/features/auth/data/models/authentication/verify_reset_code/request/verify_reset_code_request_dto.dart';
import 'package:ecommerce_elevate/features/auth/data/models/authentication/verify_reset_code/response/verify_reset_code_response_dto.dart';
import 'package:ecommerce_elevate/features/auth/domain/entities/verify_reset_code/verify_reset_code_response.dart';
import '../../../../../core/datasource_execution/mock_datasource_execution.dart';
import '../../../../home/data/datasource/impl/categories_remote_datasource_impl_test.mocks.dart';
import 'auth_remote_datasource_test.mocks.dart';

@GenerateMocks([AuthRetrofitClient])
void main() {
  test('TODO: Implement tests for auth_remote_datasource.dart', () async {
    var retrofitClient = MockAuthRetrofitClient();
    var dataSourceExecution = MockDataSourceExecution();
    var resetCode = VerifyResetCodeRequestDto(resetCode: '98989');
    var dataSource =
        AuthRemoteDatasourceImpl(retrofitClient, dataSourceExecution);
    var result = Future<VerifyResetCodeResponseDto>(
      () => VerifyResetCodeResponseDto(),
    );
    provideDummy<Future<VerifyResetCodeResponseDto>>(result);
    when(retrofitClient.verifyResetCode(resetCode)).thenAnswer(
      (_) async => result,
    );
  });
}
