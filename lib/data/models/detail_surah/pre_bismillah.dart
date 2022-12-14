import 'package:al_quran_app/domain/entities/surah_detail_entities.dart';
import 'package:equatable/equatable.dart';

import '../list_surah_models/translation_model.dart';
import 'audio.dart';
import 'text.dart';

class PreBismillah extends Equatable {
  final Text? text;
  final TranslationModel? translation;
  final Audio? audio;

  const PreBismillah({this.text, this.translation, this.audio});

  factory PreBismillah.fromJson(Map<String, dynamic> json) => PreBismillah(
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
      );

  Map<String, dynamic> toJson() => {
        'text': text?.toJson(),
        'translation': translation?.toJson(),
        'audio': audio?.toJson(),
      };

  PreBismillahEntities toEntity() => PreBismillahEntities(
        text: text?.toEntity() as TextEntities,
        translation: translation?.toEntity() as TranslationEntities,
        audio: audio?.toEntity() as AudioEntities,
      );

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [text, translation, audio];
}
