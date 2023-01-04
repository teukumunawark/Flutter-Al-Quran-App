import 'package:al_quran_app/common/theme_bloc.dart';
import 'package:al_quran_app/data/datasources/quran_data_source.dart';
import 'package:al_quran_app/domain/repositories/quran_repository.dart';
import 'package:al_quran_app/domain/usecases/get_detail_juz.dart';
import 'package:al_quran_app/domain/usecases/get_detail_surah.dart';
import 'package:al_quran_app/domain/usecases/get_juz_list.dart';
import 'package:al_quran_app/domain/usecases/get_surah_list.dart';
import 'package:al_quran_app/presentation/bloc/quran_bloc.dart';
import 'package:al_quran_app/presentation/routes/set_page.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;

import 'data/repositories/quran_repositories_impl.dart';

final locator = GetIt.instance;

void init() {
  // BLOC
  locator.registerFactory(() => SurahListBloc(
        locator(),
      ));
  locator.registerFactory(() => JuzListBloc(
        locator(),
      ));
  locator.registerFactory(() => DetailSurahBloc(
        locator(),
      ));
  locator.registerFactory(() => DetailJuzBloc(
        locator(),
      ));
  locator.registerFactory(() => SetPage());

  locator.registerFactory(() => ThemeBloc());

  // USE CASE
  locator.registerLazySingleton(() => GetSurahList(
        locator(),
      ));

  locator.registerLazySingleton(() => GetJuzList(
        locator(),
      ));

  locator.registerLazySingleton(() => GetDetailSurah(
        locator(),
      ));
  locator.registerLazySingleton(() => GetDetailJuz(
        locator(),
      ));

  // REPOSITORY
  locator.registerLazySingleton<QuranRepository>(
    () => SurahRepositoryImpl(remoteDataSource: locator()),
  );
  // DATA SOURCE
  locator.registerLazySingleton<SurahRemoteDataSource>(
    () => SurahRemoteDataSourceImpl(client: locator()),
  );

  // EXTERNAL
  locator.registerLazySingleton(() => http.Client());
}
