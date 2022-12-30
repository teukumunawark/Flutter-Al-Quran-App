import 'package:equatable/equatable.dart';

import 'name_entities.dart';
import 'revelation_entities.dart';
import 'tafsir_id_entities.dart';

class SurahEntities extends Equatable {
  final int? number;
  final int? sequence;
  final int? numberOfVerses;
  final NameEntities? name;
  final RevelationEntities? revelation;
  final TafsirEntities? tafsir;

  const SurahEntities({
    this.number,
    this.sequence,
    this.numberOfVerses,
    this.name,
    this.revelation,
    this.tafsir,
  });

  @override
  List<Object?> get props => [
        number,
        sequence,
        numberOfVerses,
        name,
        revelation,
        tafsir,
      ];
}
