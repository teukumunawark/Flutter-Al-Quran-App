import 'package:al_quran_app/common/failure.dart';
import 'package:al_quran_app/domain/entities/quran_entities.dart';
import 'package:dartz/dartz.dart';

abstract class QuranRepository {
  Future<Either<Failure, List<QuranEntities>>> getListQuran();
}
