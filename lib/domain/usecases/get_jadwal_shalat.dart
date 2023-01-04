import 'package:al_quran_app/common/failure.dart';
import 'package:al_quran_app/domain/entities/jadwal_entities/jadwal_shalat_entities.dart';
import 'package:al_quran_app/domain/repositories/quran_repository.dart';
import 'package:dartz/dartz.dart';

class GetjadwalShalat {
  final QuranRepository repository;

  GetjadwalShalat(this.repository);

  Future<Either<Failure, List<JadwalEntities>>> execute(String month) {
    return repository.getJadwalShalat(month);
  }
}
