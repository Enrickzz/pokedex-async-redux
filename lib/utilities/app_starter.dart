import 'package:async_redux/async_redux.dart';
import 'package:get_it/get_it.dart';
import 'package:pokedex_async_redux/api/api_service.dart';
import 'package:pokedex_async_redux/pokedex_app.dart';
import 'package:pokedex_async_redux/state/app_state.dart';
import 'package:flutter/material.dart';

final getIt = GetIt.instance;
void appStarter() {
  WidgetsFlutterBinding.ensureInitialized();
  final store = Store<AppState>(
    initialState: AppState.init(),
    actionObservers: [Log.printer(formatter: Log.multiLineFormatter)],
  );
  getIt.registerLazySingleton<ApiService>(() => ApiService());
  runApp(PokedexApp(store: store));
}
