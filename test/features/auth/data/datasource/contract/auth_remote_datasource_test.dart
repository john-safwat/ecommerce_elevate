import 'package:ecommerce_elevate/core/datasource_execution/datasource_execution.dart';
import 'package:ecommerce_elevate/features/auth/data/api/auth_retrofit_client.dart';
import 'package:ecommerce_elevate/features/auth/data/models/authentication/verify_reset_code/request/verify_reset_code_request_dto.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'auth_remote_datasource_test.mocks.dart';
@GenerateMocks([AuthRetrofitClient, DataSourceExecution])
void main() {
  test('TODO: Implement tests for auth_remote_datasource.dart', () async {
    var retrofitClient = MockAuthRetrofitClient();
    var resetCode = VerifyResetCodeRequestDto(resetCode: '98989');
      var response  = await retrofitClient.verifyResetCode(resetCode);
      return response.toDomain();
    });

    


}
