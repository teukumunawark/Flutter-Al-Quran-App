import 'package:al_quran_app/domain/entities/detail_surah_entities/tafsir_entities.dart';
import 'package:equatable/equatable.dart';

import '../list_surah_entities/translation_entities.dart';
import 'audio_entities.dart';
import 'meta_entities.dart';
import 'number_entities.dart';
import 'text_entities.dart';

class VerseEntities extends Equatable {
  final NumberEntities? number;
  final MetaEntities? meta;
  final TextEntities? text;
  final TranslationEntities? translation;
  final AudioEntities? audio;
  final TafsirIDEntities? tafsir;

  const VerseEntities({
    this.number,
    this.meta,
    this.text,
    this.translation,
    this.audio,
    this.tafsir,
  });

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
