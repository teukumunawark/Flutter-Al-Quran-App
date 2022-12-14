import 'package:al_quran_app/domain/entities/surah_detail_entities.dart';
import 'package:equatable/equatable.dart';

import '../list_surah_models/translation_model.dart';
import 'audio.dart';
import 'meta.dart';
import 'number.dart';
import 'tafsir.dart';
import 'text.dart';

class Verse extends Equatable {
  final Number? number;
  final Meta? meta;
  final Text? text;
  final TranslationModel? translation;
  final Audio? audio;
  final TafsirID? tafsir;

  const Verse({
    this.number,
    this.meta,
    this.text,
    this.translation,
    this.audio,
    this.tafsir,
  });

  factory Verse.fromJson(Map<String, dynamic> json) => Verse(
        number: json['number'] == null
            ? null
            : Number.fromJson(json['number'] as Map<String, dynamic>),
        meta: json['meta'] == null
            ? null
            : Meta.fromJson(json['meta'] as Map<String, dynamic>),
        text: json['text'] == null
            ? null
            : Text.fromJson(json['text'] as Map<String, dynamic>),
        translation: json['translation'] == null
            ? null
            : TranslationModel.fromJson(
                json['translation'] as Map<String, dynamic>),
        audio: json['audio'] == null
            ? null
            : Audio.fromJson(json['audio'] as Map<String, dynamic>),
        tafsir: json['tafsir'] == null
            ? null
            : TafsirID.fromJson(json['tafsir'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        'number': number?.toJson(),
        'meta': meta?.toJson(),
        'text': text?.toJson(),
        'translation': translation?.toJson(),
        'audio': audio?.toJson(),
        'tafsir': tafsir?.toJson(),
      };

  VerseEntities toEntity() => VerseEntities(
        audio: audio?.toEntity() as AudioEntities,
        meta: meta?.toEntity() as MetaEntities,
        text: text?.toEntity() as TextEntities,
        translation: translation?.toEntity() as TranslationEntities,
        tafsir: tafsir?.toEntity() as TafsirIDEntities,
        number: number?.toEntity() as NumberEntities,
      );

  @override
  bool get stringify => true;

  @override
  List<Object?> get props {
    return [
      number,
      meta,
      text,
      translation,
      audio,
      tafsir,
    ];
  }
}
