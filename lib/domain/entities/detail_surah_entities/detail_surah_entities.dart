import 'package:al_quran_app/domain/entities/detail_surah_entities/pre_bismillah_entities.dart';
import 'package:al_quran_app/domain/entities/detail_surah_entities/verse_entities.dart';
import 'package:al_quran_app/domain/entities/list_surah_entities/tafsir_id_entities.dart';
import 'package:equatable/equatable.dart';

import '../list_surah_entities/name_entities.dart';
import '../list_surah_entities/revelation_entities.dart';

class DetailSurahEntities extends Equatable {
  final int? number;
  final int? sequence;
  final int? numberOfVerses;
  final NameEntities? name;
  final RevelationEntities? revelation;
  final TafsirEntities? tafsir;
  final PreBismillahEntities? preBismillah;
  final List<VerseEntities>? verses;

  const DetailSurahEntities({
    this.number,
    this.sequence,
    this.numberOfVerses,
    this.name,
    this.revelation,
    this.tafsir,
    this.preBismillah,
    this.verses,
  });

  @override
  List<Object?> get props => [
        number,
        sequence,
        numberOfVerses,
        name,
        revelation,
        tafsir,
        preBismillah,
        verses,
      ];
}
