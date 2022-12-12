import 'package:equatable/equatable.dart';

import 'audio.dart';
import 'text.dart';
import 'translation.dart';

class PreBismillah extends Equatable {
  final Text? text;
  final Translation? translation;
  final Audio? audio;

  const PreBismillah({this.text, this.translation, this.audio});

  factory PreBismillah.fromJson(Map<String, dynamic> json) => PreBismillah(
        text: json['text'] == null
            ? null
            : Text.fromJson(json['text'] as Map<String, dynamic>),
        translation: json['translation'] == null
            ? null
            : Translation.fromJson(json['translation'] as Map<String, dynamic>),
        audio: json['audio'] == null
            ? null
            : Audio.fromJson(json['audio'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        'text': text?.toJson(),
        'translation': translation?.toJson(),
        'audio': audio?.toJson(),
      };

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [text, translation, audio];
}
