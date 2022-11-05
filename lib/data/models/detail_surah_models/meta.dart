import 'package:equatable/equatable.dart';

import 'sajda.dart';

class MetaDetail extends Equatable {
  final int juz;
  final int page;
  final int manzil;
  final int ruku;
  final int hizbQuarter;
  final SajdaDetail sajda;

  const MetaDetail({
    required this.juz,
    required this.page,
    required this.manzil,
    required this.ruku,
    required this.hizbQuarter,
    required this.sajda,
  });

  factory MetaDetail.fromJson(Map<String, dynamic> json) => MetaDetail(
        juz: json['juz'],
        page: json['page'],
        manzil: json['manzil'],
        ruku: json['ruku'],
        hizbQuarter: json['hizbQuarter'],
        sajda: SajdaDetail.fromJson(json['sajda'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        'juz': juz,
        'page': page,
        'manzil': manzil,
        'ruku': ruku,
        'hizbQuarter': hizbQuarter,
        'sajda': sajda.toJson(),
      };

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
