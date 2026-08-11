import 'package:animebox/core/configs/presentation/controllers/config_controller.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

final injector = GetIt.instance;

void setupInjector({
  ConfigController? configController,
  required SharedPreferences sharedPreferences,
}) {
  injector.registerLazySingleton(() => configController ?? ConfigController());

  injector.registerLazySingleton(() => sharedPreferences);
}
