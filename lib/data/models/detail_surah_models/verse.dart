import 'package:equatable/equatable.dart';

import 'audio.dart';
import 'meta.dart';
import 'number.dart';
import 'tafsir.dart';
import 'text.dart';
import 'translation.dart';

class VerseDetail extends Equatable {
  final NumberDetail number;
  final MetaDetail meta;
  final TextDetail text;
  final TranslationDetail translation;
  final AudioDetail audio;
  final TafsirDetail tafsir;

  const VerseDetail({
    required this.number,
    required this.meta,
    required this.text,
    required this.translation,
    required this.audio,
    required this.tafsir,
  });

  factory VerseDetail.fromJson(Map<String, dynamic> json) => VerseDetail(
        number: NumberDetail.fromJson(json['number'] as Map<String, dynamic>),
        meta: MetaDetail.fromJson(json['meta'] as Map<String, dynamic>),
        text: TextDetail.fromJson(json['text'] as Map<String, dynamic>),
        translation: TranslationDetail.fromJson(
            json['translation'] as Map<String, dynamic>),
        audio: AudioDetail.fromJson(json['audio'] as Map<String, dynamic>),
        tafsir: TafsirDetail.fromJson(json['tafsir'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        'number': number.toJson(),
        'meta': meta.toJson(),
        'text': text.toJson(),
        'translation': translation.toJson(),
        'audio': audio.toJson(),
        'tafsir': tafsir.toJson(),
      };

  @override
  List<Object?> get props => [
        number,
        meta,
        text,
        translation,
        audio,
        tafsir,
      ];
}
