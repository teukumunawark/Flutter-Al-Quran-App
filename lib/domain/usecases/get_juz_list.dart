import 'package:al_quran_app/common/failure.dart';
import 'package:al_quran_app/domain/entities/juz_entities/juz_entities.dart';
import 'package:al_quran_app/domain/repositories/quran_repository.dart';
import 'package:dartz/dartz.dart';

class GetJuzList {
  final QuranRepository repository;

  GetJuzList(this.repository);

  Future<Either<Failure, List<JuzEntities>>> execute() {
    return repository.getListJuz();
  }
}
