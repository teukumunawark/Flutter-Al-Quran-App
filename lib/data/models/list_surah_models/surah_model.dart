import 'package:al_quran_app/data/models/list_surah_models/tafsir_model.dart';
import 'package:equatable/equatable.dart';

import '../../../domain/entities/list_surah_entities/surah_entities.dart';
import 'name_model.dart';
import 'revalation_model.dart';

class SurahModel extends Equatable {
  final int number;
  final int sequence;
  final int numberOfVerses;
  final NameModel name;
  final RevelationModel revelation;
  final TafsirModel tafsir;

  const SurahModel({
    required this.number,
    required this.sequence,
    required this.numberOfVerses,
    required this.name,
    required this.revelation,
    required this.tafsir,
  });

  factory SurahModel.fromJson(Map<String, dynamic> json) => SurahModel(
        number: json['number'],
        sequence: json['sequence'],
        numberOfVerses: json['numberOfVerses'],
        name: NameModel.fromJson(json['name'] as Map<String, dynamic>),
        revelation: RevelationModel.fromJson(
            json['revelation'] as Map<String, dynamic>),
        tafsir: TafsirModel.fromJson(json['tafsir'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        'number': number,
        'sequence': sequence,
        'numberOfVerses': numberOfVerses,
        'name': name.toJson(),
        'revelation': revelation.toJson(),
        'tafsir': tafsir.toJson(),
      };

  SurahEntities toEntity() => SurahEntities(
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
