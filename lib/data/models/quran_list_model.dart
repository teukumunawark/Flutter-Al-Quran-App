import 'package:equatable/equatable.dart';

import '../../domain/entities/surah_list_entities.dart';

class QuranModel extends Equatable {
  final int number;
  final int sequence;
  final int numberOfVerses;
  final Name name;
  final Revelation revelation;
  final Tafsir tafsir;

  const QuranModel({
    required this.number,
    required this.sequence,
    required this.numberOfVerses,
    required this.name,
    required this.revelation,
    required this.tafsir,
  });

  factory QuranModel.fromJson(Map<String, dynamic> json) => QuranModel(
        number: json['number'],
        sequence: json['sequence'],
        numberOfVerses: json['numberOfVerses'],
        name: Name.fromJson(json['name'] as Map<String, dynamic>),
        revelation:
            Revelation.fromJson(json['revelation'] as Map<String, dynamic>),
        tafsir: Tafsir.fromJson(json['tafsir'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        'number': number,
        'sequence': sequence,
        'numberOfVerses': numberOfVerses,
        'name': name.toJson(),
        'revelation': revelation.toJson(),
        'tafsir': tafsir.toJson(),
      };

  QuranEntities toEntity() => QuranEntities(
        number: number,
        sequence: sequence,
        numberOfVerses: numberOfVerses,
        name: name.toEntity(),
        revelation: revelation.toEntity(),
        tafsir: tafsir.toEntity(),
      );

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

class Name extends Equatable {
  final String short;
  final String long;
  final Translation translation;
  final Translation transliteration;

  const Name({
    required this.short,
    required this.long,
    required this.transliteration,
    required this.translation,
  });

  factory Name.fromJson(Map<String, dynamic> json) => Name(
        short: json['short'],
        long: json['long'],
        transliteration: Translation.fromJson(
            json['transliteration'] as Map<String, dynamic>),
        translation:
            Translation.fromJson(json['translation'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        'short': short,
        'long': long,
        'transliteration': transliteration.toJson(),
        'translation': translation.toJson(),
      };

  NameEntities toEntity() => NameEntities(
        short: short,
        long: long,
        translation: translation.toEntity(),
        transliteration: transliteration.toEntity(),
      );

  @override
  List<Object?> get props => [
        short,
        long,
        transliteration,
        translation,
      ];
}

class Revelation extends Equatable {
  final String arab;
  final String en;
  final String id;

  const Revelation({
    required this.arab,
    required this.en,
    required this.id,
  });

  factory Revelation.fromJson(Map<String, dynamic> json) => Revelation(
        arab: json['arab'],
        en: json['en'],
        id: json['id'],
      );

  Map<String, dynamic> toJson() => {
        'arab': arab,
        'en': en,
        'id': id,
      };

  RevelationEntities toEntity() => RevelationEntities(
        arab: arab,
        en: en,
        id: id,
      );

  @override
  List<Object?> get props => [arab, en, id];
}

class Tafsir extends Equatable {
  final String id;

  const Tafsir({required this.id});

  factory Tafsir.fromJson(Map<String, dynamic> json) => Tafsir(
        id: json['id'],
      );

  Map<String, dynamic> toJson() => {
        'id': id,
      };

  TafsirEntities toEntity() => TafsirEntities(id: id);

  @override
  List<Object?> get props => [id];
}

class Translation extends Equatable {
  final String en;
  final String id;

  const Translation({required this.en, required this.id});

  factory Translation.fromJson(Map<String, dynamic> json) => Translation(
        en: json['en'],
        id: json['id'],
      );

  Map<String, dynamic> toJson() => {
        'en': en,
        'id': id,
      };

  TranslationEntities toEntity() => TranslationEntities(
        en: en,
        id: id,
      );

  @override
  List<Object?> get props => [en, id];
}
