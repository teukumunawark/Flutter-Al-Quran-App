import 'package:dartz/dartz.dart';

import '../../common/failure.dart';
import '../entities/surah_entities/detail_surah_entities/detail_surah_entities.dart';
import '../repositories/quran_repository.dart';

class GetDetailSurah {
  final QuranRepository repository;

  GetDetailSurah(this.repository);

  Future<Either<Failure, DetailSurahEntities>> execute(String id) {
    return repository.getDetailSurah(id);
  }
}
