import 'package:al_quran_app/domain/entities/surah_entities/detail_surah_entities/sajda_entities.dart';
import 'package:equatable/equatable.dart';

class MetaEntities extends Equatable {
  final int? juz;
  final int? page;
  final int? manzil;
  final int? ruku;
  final int? hizbQuarter;
  final SajdaEntities? sajda;

  const MetaEntities({
    this.juz,
    this.page,
    this.manzil,
    this.ruku,
    this.hizbQuarter,
    this.sajda,
  });

  @override
  List<Object?> get props => [
        juz,
        page,
        manzil,
        ruku,
        hizbQuarter,
        sajda,
      ];
}
