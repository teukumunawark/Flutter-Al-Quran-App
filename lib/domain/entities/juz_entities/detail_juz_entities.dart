import 'package:al_quran_app/domain/entities/surah_entities/detail_surah_entities/verse_entities.dart';
import 'package:equatable/equatable.dart';

class DetailJuzEntities extends Equatable {
  final int? juz;
  final int? juzStartSurahNumber;
  final int? juzEndSurahNumber;
  final int? totalVerses;
  final String? juzStartInfo;
  final String? juzEndInfo;
  final List<VerseEntities>? verses;

  const DetailJuzEntities({
    this.juz,
    this.juzStartSurahNumber,
    this.juzEndSurahNumber,
    this.totalVerses,
    this.juzStartInfo,
    this.juzEndInfo,
    this.verses,
  });

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
