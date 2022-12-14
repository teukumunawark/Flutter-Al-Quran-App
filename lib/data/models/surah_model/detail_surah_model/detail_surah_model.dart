import 'package:al_quran_app/data/models/surah_model/list_surah_models/tafsir_model.dart';
import 'package:equatable/equatable.dart';

import '../../../../domain/entities/surah_entities/detail_surah_entities/detail_surah_entities.dart';
import '../list_surah_models/name_model.dart';
import '../list_surah_models/revalation_model.dart';
import 'pre_bismillah_model.dart';
import 'verse_model.dart';

class DetailSurah extends Equatable {
  final int? number;
  final int? sequence;
  final int? numberOfVerses;
  final NameModel? name;
  final RevelationModel? revelation;
  final TafsirModel? tafsir;
  final PreBismillahModel? preBismillah;
  final List<VerseModel>? verses;

  const DetailSurah({
    this.name,
    this.number,
    this.sequence,
    this.numberOfVerses,
    this.revelation,
    this.tafsir,
    this.preBismillah,
    this.verses,
  });

  factory DetailSurah.fromJson(Map<String, dynamic> json) => DetailSurah(
        number: json['number'] as int?,
        sequence: json['sequence'] as int?,
        numberOfVerses: json['numberOfVerses'] as int?,
        name: json['name'] == null
            ? null
            : NameModel.fromJson(json['name'] as Map<String, dynamic>),
        revelation: json['revelation'] == null
            ? null
            : RevelationModel.fromJson(
                json['revelation'] as Map<String, dynamic>),
        tafsir: json['tafsir'] == null
            ? null
            : TafsirModel.fromJson(json['tafsir'] as Map<String, dynamic>),
        preBismillah: json['preBismillah'] == null
            ? null
            : PreBismillahModel.fromJson(
                json['preBismillah'] as Map<String, dynamic>),
        verses: (json['verses'] as List<dynamic>?)
            ?.map((e) => VerseModel.fromJson(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toJson() => {
        'number': number,
        'sequence': sequence,
        'numberOfVerses': numberOfVerses,
        'name': name?.toJson(),
        'revelation': revelation?.toJson(),
        'tafsir': tafsir?.toJson(),
        'preBismillah': preBismillah?.toJson(),
        'verses': verses?.map((e) => e.toJson()).toList(),
      };

  DetailSurahEntities toEntity() => DetailSurahEntities(
        number: number,
        sequence: sequence,
        numberOfVerses: numberOfVerses,
        name: name?.toEntity(),
        revelation: revelation?.toEntity(),
        tafsir: tafsir?.toEntity(),
        preBismillah: preBismillah?.toEntity(),
        verses: verses?.map((e) => e.toEntity()).toList(),
      );

  @override
  List<Object?> get props {
    return [
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
}
