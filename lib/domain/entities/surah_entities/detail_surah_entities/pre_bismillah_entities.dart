import 'package:al_quran_app/domain/entities/surah_entities/detail_surah_entities/audio_entities.dart';
import 'package:al_quran_app/domain/entities/surah_entities/detail_surah_entities/text_entities.dart';
import 'package:equatable/equatable.dart';

import '../list_surah_entities/translation_entities.dart';

class PreBismillahEntities extends Equatable {
  final TextEntities? text;
  final TranslationEntities? translation;
  final AudioEntities? audio;

  const PreBismillahEntities({this.text, this.translation, this.audio});

  @override
  List<Object?> get props => [
        text,
        translation,
        audio,
      ];
}
