import 'package:equatable/equatable.dart';

import '../../../../domain/entities/surah_entities/detail_surah_entities/meta_entities.dart';
import '../../../../domain/entities/surah_entities/detail_surah_entities/sajda_entities.dart';
import 'sajda_nodel.dart';

class Meta extends Equatable {
  final int? juz;
  final int? page;
  final int? manzil;
  final int? ruku;
  final int? hizbQuarter;
  final Sajda? sajda;

  const Meta({
    this.juz,
    this.page,
    this.manzil,
    this.ruku,
    this.hizbQuarter,
    this.sajda,
  });

  factory Meta.fromJson(Map<String, dynamic> json) => Meta(
        juz: json['juz'] as int?,
        page: json['page'] as int?,
        manzil: json['manzil'] as int?,
        ruku: json['ruku'] as int?,
        hizbQuarter: json['hizbQuarter'] as int?,
        sajda: json['sajda'] == null
            ? null
            : Sajda.fromJson(
                json['sajda'] as Map<String, dynamic>,
              ),
      );

  Map<String, dynamic> toJson() => {
        'juz': juz,
        'page': page,
        'manzil': manzil,
        'ruku': ruku,
        'hizbQuarter': hizbQuarter,
        'sajda': sajda?.toJson(),
      };

  MetaEntities toEntity() => MetaEntities(
        juz: juz,
        page: page,
        manzil: manzil,
        ruku: ruku,
        hizbQuarter: hizbQuarter,
        sajda: sajda?.toEntity() as SajdaEntities,
      );

  @override
  bool get stringify => true;

  @override
  List<Object?> get props {
    return [
      juz,
      page,
      manzil,
      ruku,
      hizbQuarter,
      sajda,
    ];
  }
}
