import 'package:al_quran_app/common/failure.dart';
import 'package:al_quran_app/domain/entities/quran_entities.dart';
import 'package:al_quran_app/domain/repositories/quran_repository.dart';
import 'package:dartz/dartz.dart';

class GetSurahList {
  final QuranRepository repository;

  GetSurahList(this.repository);

  Future<Either<Failure, List<QuranEntities>>> execute() {
    return repository.getListQuran();
  }
}
