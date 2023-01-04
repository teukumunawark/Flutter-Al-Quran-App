import 'package:al_quran_app/data/models/surah_model/detail_surah_model/verse_model.dart';
import 'package:equatable/equatable.dart';
import '../../../domain/entities/juz_entities/detail_juz_entities.dart';

class DetailJuz extends Equatable {
  final int? juz;
  final int? juzStartSurahNumber;
  final int? juzEndSurahNumber;
  final int? totalVerses;
  final String? juzStartInfo;
  final String? juzEndInfo;
  final List<VerseModel>? verses;

  const DetailJuz({
    this.juz,
    this.juzStartSurahNumber,
    this.juzEndSurahNumber,
    this.totalVerses,
    this.juzStartInfo,
    this.juzEndInfo,
    this.verses,
  });

  factory DetailJuz.fromJson(Map<String, dynamic> json) => DetailJuz(
        juz: json['juz'] as int,
        juzStartSurahNumber: json['juzStartSurahNumber'] as int,
        juzEndSurahNumber: json['juzEndSurahNumber'] as int,
        totalVerses: json['totalVerses'] as int,
        juzStartInfo: json['juzStartInfo'] as String,
        juzEndInfo: json['juzEndInfo'] as String,
        verses: (json['verses'] as List<dynamic>?)
            ?.map((e) => VerseModel.fromJson(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toJson() => {
        "juz": juz,
        "juzStartSurahNumber": juzStartSurahNumber,
        "juzEndSurahNumber": juzEndSurahNumber,
        "totalVerses": totalVerses,
        "juzStartInfo": juzStartInfo,
        "juzEndInfo": juzEndInfo,
        'verses': verses?.map((e) => e.toJson()).toList(),
      };

  DetailJuzEntities toEntity() => DetailJuzEntities(
        juz: juz as int,
        juzStartSurahNumber: juzStartSurahNumber as int,
        juzEndSurahNumber: juzEndSurahNumber as int,
        totalVerses: totalVerses as int,
        juzStartInfo: juzStartInfo as String,
        juzEndInfo: juzEndInfo as String,
        verses: verses?.map((e) => e.toEntity()).toList(),
      );

  @override
  List<Object?> get props => [
        juz,
        juzStartSurahNumber,
        juzEndSurahNumber,
        totalVerses,
        juzStartInfo,
        juzEndInfo,
        verses,
      ];
}
