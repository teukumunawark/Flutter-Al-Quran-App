import 'package:equatable/equatable.dart';

import '../../../../domain/entities/surah_entities/detail_surah_entities/audio_entities.dart';

class Audio extends Equatable {
  final String? primary;
  final List<String>? secondary;

  const Audio({this.primary, this.secondary});

  factory Audio.fromJson(Map<String, dynamic> json) => Audio(
        primary: json['primary'],
        secondary: List<String>.from(json['secondary'].map((e) => e)),
      );

  Map<String, dynamic> toJson() => {
        'primary': primary,
        'secondary': secondary,
      };

  AudioEntities toEntity() => AudioEntities(
        primary: primary,
        secondary: secondary,
      );

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [primary, secondary];
}
