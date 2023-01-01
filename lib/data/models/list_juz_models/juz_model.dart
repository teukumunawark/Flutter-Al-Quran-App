import 'package:equatable/equatable.dart';
import '../../../domain/entities/list_juz_entities/juz_entities.dart';

class JuzModel extends Equatable {
  final int? juz;
  final int? juzStartSurahNumber;
  final int? juzEndSurahNumber;
  final int? totalVerses;
  final String? juzStartInfo;
  final String? juzEndInfo;

  const JuzModel({
    this.juz,
    this.juzStartSurahNumber,
    this.juzEndSurahNumber,
    this.totalVerses,
    this.juzStartInfo,
    this.juzEndInfo,
  });

  factory JuzModel.fromJson(Map<String, dynamic> json) => JuzModel(
        juz: json['juz'] as int,
        juzStartSurahNumber: json['juzStartSurahNumber'] as int,
        juzEndSurahNumber: json['juzEndSurahNumber'] as int,
        totalVerses: json['totalVerses'] as int,
        juzStartInfo: json['juzStartInfo'] as String,
        juzEndInfo: json['juzEndInfo'] as String,
      );

  Map<String, dynamic> toJson() => {
        "juz": juz,
        "juzStartSurahNumber": juzStartSurahNumber,
        "juzEndSurahNumber": juzEndSurahNumber,
        "totalVerses": totalVerses,
        "juzStartInfo": juzStartInfo,
        "juzEndInfo": juzEndInfo,
      };

  JuzEntities toEntity() => JuzEntities(
        juz: juz as int,
        juzStartSurahNumber: juzStartSurahNumber as int,
        juzEndSurahNumber: juzEndSurahNumber as int,
        totalVerses: totalVerses as int,
        juzStartInfo: juzStartInfo as String,
        juzEndInfo: juzEndInfo as String,
      );

  @override
  List<Object?> get props => [
        juz,
        juzStartSurahNumber,
        juzEndSurahNumber,
        totalVerses,
        juzStartInfo,
        juzEndInfo,
      ];
}
