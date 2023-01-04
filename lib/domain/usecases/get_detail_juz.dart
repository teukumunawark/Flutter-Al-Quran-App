import 'package:al_quran_app/common/failure.dart';
import 'package:al_quran_app/domain/entities/juz_entities/detail_juz_entities.dart';
import 'package:al_quran_app/domain/repositories/quran_repository.dart';
import 'package:dartz/dartz.dart';

class GetDetailJuz {
  final QuranRepository repository;

  GetDetailJuz(this.repository);

  Future<Either<Failure, DetailJuzEntities>> execute(String id) {
    return repository.getDetailJuz(id);
  }
}
