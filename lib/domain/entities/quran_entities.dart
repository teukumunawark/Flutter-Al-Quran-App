import 'package:equatable/equatable.dart';

class QuranEntities extends Equatable {
  final int number;
  final int sequence;
  final int numberOfVerses;
  final NameEntities name;
  final RevelationEntities revelation;
  final TafsirEntities tafsir;

  const QuranEntities({
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

class NameEntities extends Equatable {
  final String short;
  final String long;
  final TranslationEntities translation;
  final TranslationEntities transliteration;

  const NameEntities({
    required this.short,
    required this.long,
    required this.translation,
    required this.transliteration,
  });

  @override
  List<Object> get props => [
        short,
        long,
        transliteration,
        translation,
      ];
}

class TranslationEntities extends Equatable {
  final String en;
  final String id;

  const TranslationEntities({
    required this.en,
    required this.id,
  });

  @override
  List<Object> get props => [en, id];
}

class RevelationEntities extends Equatable {
  final String arab;
  final String en;
  final String id;

  const RevelationEntities({
    required this.arab,
    required this.en,
    required this.id,
  });

  @override
  List<Object> get props => [
        arab,
        en,
        id,
      ];
}

class TafsirEntities extends Equatable {
  final String id;

  const TafsirEntities({required this.id});

  @override
  List<Object> get props => [id];
}
