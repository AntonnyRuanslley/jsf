import 'package:jsf/controllers/app_state.dart';
import 'package:get_it/get_it.dart';

GetIt singleton = GetIt.instance;

void setupSingletonClasses() {
  singleton.registerLazySingleton(() => AppState());
}
