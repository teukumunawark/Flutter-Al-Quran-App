import 'package:al_quran_app/common/failure.dart';
import 'package:dartz/dartz.dart';

import '../entities/list_surah_entities/surah_entities.dart';
import '../entities/surah_detail_entities.dart';

abstract class SurahRepository {
  Future<Either<Failure, List<SurahEntities>>> getListSurah();
  Future<Either<Failure, DetailSurahEntities>> getDetailSurah();
}
