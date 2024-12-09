// 📦 Package imports:

// 🌎 Project imports:
import 'package:ecommerce_elevate/core/di/di.config.dart';
// 📦 Package imports:
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

final getIt = GetIt.instance;

@InjectableInit(
  initializerName: 'init', // default
  preferRelativeImports: true, // default
  asExtension: true, // default
)
Future<void> configureDependencies() async => await getIt.init();
