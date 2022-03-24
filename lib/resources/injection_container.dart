// ignore: import_of_legacy_library_into_null_safe
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../core/network/client.dart';
import '../core/network/client.dart';
import '../features/news/data/datasource/nasa_news_data_source.dart';
import '../features/news/data/repositories/nasa_news_repository_impl.dart';
import '../features/news/domain/repositories/nasa_news_repository.dart';
import '../features/news/domain/usecase/get_daily_nasa_news.dart';
import '../features/news/presentation/bloc/news_bloc.dart';
import 'network/network_constants.dart';

final di = GetIt.instance;

Future<void> init() async {
  /* -----------News----------*/
  di.registerFactory(() => NasaNewsDatasource(client: di()));
  di.registerFactory<NasaNewsRepository>(
      () => NasaNewsRepositoryImpl(dataSource: di()));
  di.registerFactory(() => GetDailyNasaNews(repository: di()));
  di.registerFactory(
    () => NewsBloc(
      getDailyNasaNews: di(),
      sharedPreferences: di(),
    ),
  );
  /*------------Singletons-------*/
  di.registerLazySingleton<NetworkConstants>(() => NetworkConstants());
  di.registerLazySingleton(() => Client(dio: di()));
  di.registerLazySingleton(() => Dio());
  //di.registerFactory(() => Repository(networkInfo: di()));
  final sharedPreference = await SharedPreferences.getInstance();
  di.registerLazySingleton<SharedPreferences>(() => sharedPreference);
}
