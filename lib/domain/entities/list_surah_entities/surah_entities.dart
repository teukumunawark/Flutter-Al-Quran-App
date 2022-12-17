import 'package:equatable/equatable.dart';

import 'name_entities.dart';
import 'revelation_entities.dart';
import 'tafsir_id_entities.dart';

class SurahEntities extends Equatable {
  final int number;
  final int sequence;
  final int numberOfVerses;
  final NameEntities name;
  final RevelationEntities revelation;
  final TafsirEntities tafsir;

  const SurahEntities({
    required this.number,
    required this.sequence,
    required this.numberOfVerses,
    required this.name,
    required this.revelation,
    required this.tafsir,
  });

  @override
  List<Object> get props => [
        number,
        sequence,
        numberOfVerses,
        name,
        revelation,
        tafsir,
      ];
}
