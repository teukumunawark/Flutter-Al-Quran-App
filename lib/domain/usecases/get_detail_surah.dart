import 'package:al_quran_app/domain/entities/surah_detail_entities.dart';
import 'package:dartz/dartz.dart';

import '../../common/failure.dart';
import '../repositories/quran_repository.dart';

class GetDetailSurah {
  final SurahRepository repository;

  GetDetailSurah(this.repository);

  Future<Either<Failure, DetailSurahEntities>> execute() {
    return repository.getDetailSurah();
  }
}
