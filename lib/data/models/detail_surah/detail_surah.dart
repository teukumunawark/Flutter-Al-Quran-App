import 'package:equatable/equatable.dart';

import 'name.dart';
import 'pre_bismillah.dart';
import 'revelation.dart';
import 'tafsir.dart';
import 'verse.dart';

class DetailSurah extends Equatable {
  final int? number;
  final int? sequence;
  final int? numberOfVerses;
  final Name? name;
  final Revelation? revelation;
  final TafsirID? tafsir;
  final PreBismillah? preBismillah;
  final List<Verse>? verses;

  const DetailSurah({
    this.number,
    this.sequence,
    this.numberOfVerses,
    this.name,
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
            : Name.fromJson(json['name'] as Map<String, dynamic>),
        revelation: json['revelation'] == null
            ? null
            : Revelation.fromJson(json['revelation'] as Map<String, dynamic>),
        tafsir: json['tafsir'] == null
            ? null
            : TafsirID.fromJson(json['tafsir'] as Map<String, dynamic>),
        preBismillah: json['preBismillah'] == null
            ? null
            : PreBismillah.fromJson(
                json['preBismillah'] as Map<String, dynamic>),
        verses: (json['verses'] as List<dynamic>?)
            ?.map((e) => Verse.fromJson(e as Map<String, dynamic>))
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

  @override
  bool get stringify => true;

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
