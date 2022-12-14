import 'package:dartz/dartz.dart';

import '../../common/failure.dart';
import '../entities/list_surah_entities/surah_entities.dart';
import '../repositories/quran_repository.dart';

class GetSurahList {
  final SurahRepository repository;

  GetSurahList(this.repository);

  Future<Either<Failure, List<SurahEntities>>> execute() {
    return repository.getListSurah();
  }
}
