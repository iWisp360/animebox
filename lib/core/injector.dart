import 'package:animebox/core/configs/presentation/controllers/config_controller.dart';
import 'package:get_it/get_it.dart';

final injector = GetIt.instance;

void setupInjector() {
  injector.registerLazySingleton(() => ConfigController());
}
