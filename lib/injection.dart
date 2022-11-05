import 'package:al_quran_app/data/datasources/remote_data_source/quran_data_source.dart';
import 'package:al_quran_app/data/repositories/quran_repositories_impl.dart';
import 'package:al_quran_app/domain/repositories/quran_repository.dart';
import 'package:al_quran_app/domain/usecases/get_surah_list.dart';
import 'package:al_quran_app/presentation/bloc/quran_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;

final locator = GetIt.instance;

void init() {
  // Bloc
  locator.registerFactory(() => SurahListBloc(
        locator(),
      ));
  // Use Case
  locator.registerLazySingleton(() => GetSurahList(
        locator(),
      ));
  // Repository
  locator.registerLazySingleton<QuranRepository>(
    () => QuranRepositoryImpl(remoteDataSource: locator()),
  );
  // Data Source
  locator.registerLazySingleton<QuranRemoteDataSource>(
    () => QuranRemoteDataSourceImpl(client: locator()),
  );
  // Helper

  // External
  locator.registerLazySingleton(() => http.Client());
}
