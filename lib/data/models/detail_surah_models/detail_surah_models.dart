import 'package:equatable/equatable.dart';

import 'name.dart';
import 'revelation.dart';
import 'tafsir.dart';
import 'verse.dart';

class DetailSurahModels extends Equatable {
  final int number;
  final int sequence;
  final int numberOfVerses;
  final NameDetail name;
  final RevelationDetail revelation;
  final TafsirDetail tafsir;
  final dynamic preBismillah;
  final List<VerseDetail> verses;

  const DetailSurahModels({
    required this.number,
    required this.sequence,
    required this.numberOfVerses,
    required this.name,
    required this.revelation,
    required this.tafsir,
    required this.preBismillah,
    required this.verses,
  });

  factory DetailSurahModels.fromJson(Map<String, dynamic> json) {
    return DetailSurahModels(
      number: json['number'],
      sequence: json['sequence'],
      numberOfVerses: json['numberOfVerses'],
      name: NameDetail.fromJson(json['name'] as Map<String, dynamic>),
      revelation:
          RevelationDetail.fromJson(json['revelation'] as Map<String, dynamic>),
      tafsir: TafsirDetail.fromJson(json['tafsir'] as Map<String, dynamic>),
      preBismillah: json['preBismillah'] as dynamic,
      verses: List<VerseDetail>.from(json["verses"].map(
        (e) => VerseDetail.fromJson(e),
      )).toList(),
    );
  }

  Map<String, dynamic> toJson() => {
        'number': number,
        'sequence': sequence,
        'numberOfVerses': numberOfVerses,
        'name': name.toJson(),
        'revelation': revelation.toJson(),
        'tafsir': tafsir.toJson(),
        'preBismillah': preBismillah,
        'verses': verses.map((e) => e.toJson()).toList(),
      };

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
