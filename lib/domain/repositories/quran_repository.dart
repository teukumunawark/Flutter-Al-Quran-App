import 'package:al_quran_app/common/failure.dart';
import 'package:al_quran_app/domain/entities/detail_juz_entities/detail_juz_entities.dart';
import 'package:al_quran_app/domain/entities/list_juz_entities/juz_entities.dart';
import 'package:dartz/dartz.dart';

import '../entities/detail_surah_entities/detail_surah_entities.dart';
import '../entities/list_surah_entities/surah_entities.dart';

abstract class SurahRepository {
  Future<Either<Failure, List<SurahEntities>>> getListSurah();
  Future<Either<Failure, List<JuzEntities>>> getListJuz();
  Future<Either<Failure, DetailSurahEntities>> getDetailSurah(String id);
  Future<Either<Failure, DetailJuzEntities>> getDetailJuz(String id);
}
