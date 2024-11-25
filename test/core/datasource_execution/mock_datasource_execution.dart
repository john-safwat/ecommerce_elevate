// 📦 Package imports:
import 'package:mockito/mockito.dart';
import 'package:mockito/src/dummies.dart';

// 🌎 Project imports:
import 'package:ecommerce_elevate/core/datasource_execution/datasource_execution.dart';
import 'package:ecommerce_elevate/core/datasource_execution/results.dart';

class MockDataSourceExecution extends Mock implements DataSourceExecution {
  MockDataSourceExecution() {
    throwOnMissingStub(this);
  }

  @override
  Future<Results<T>> execute<T>(Future<T> Function()? apiCall) =>
      (super.noSuchMethod(
        Invocation.method(
          #execute,
          [apiCall],
        ),
        returnValue: Future<Results<T>>.value(dummyValue<Results<T>>(
          this,
          Invocation.method(
            #execute,
            [apiCall],
          ),
        )),
      ) as Future<Results<T>>);
}
