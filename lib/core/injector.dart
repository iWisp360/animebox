import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

final injector = GetIt.instance;

void setupInjector({required SharedPreferences sharedPreferences}) {
  injector.registerLazySingleton(() => sharedPreferences);
}
