// 📦 Package imports:
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';

// 🌎 Project imports:
import 'package:ecommerce_elevate/domain/use_case/login_user_use_case.dart';
import 'package:ecommerce_elevate/features/login/login_contract.dart';
import 'package:ecommerce_elevate/features/login/login_view_model.dart';
import 'login_view_model_test.mocks.dart';

@GenerateMocks([LoginUserUseCase])
void main() {
  group("guest login test", (){
    test("should emit LoginSuccessState when GuestLoginAction is triggered", (){

      MockLoginUserUseCase loginUserUseCase = MockLoginUserUseCase();
      var viewModel = LoginViewModel(loginUserUseCase);

      viewModel.doIntent(GuestLoginAction());

      expect(viewModel.state, isA<LoginSuccessState>());
    });
  });
}
