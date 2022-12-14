import 'package:equatable/equatable.dart';

import '../../../domain/entities/list_surah_entities/name_entities.dart';
import 'translation_model.dart';

class NameModel extends Equatable {
  final String short;
  final String long;
  final TranslationModel translation;
  final TranslationModel transliteration;

  const NameModel({
    required this.short,
    required this.long,
    required this.transliteration,
    required this.translation,
  });

  factory NameModel.fromJson(Map<String, dynamic> json) => NameModel(
        short: json['short'],
        long: json['long'],
        transliteration: TranslationModel.fromJson(
            json['transliteration'] as Map<String, dynamic>),
        translation: TranslationModel.fromJson(
            json['translation'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        'short': short,
        'long': long,
        'transliteration': transliteration.toJson(),
        'translation': translation.toJson(),
      };

  NameEntities toEntity() => NameEntities(
        short: short,
        long: long,
        translation: translation.toEntity(),
        transliteration: transliteration.toEntity(),
      );

  @override
  List<Object?> get props => [
        short,
        long,
        transliteration,
        translation,
      ];
}
