import 'package:equatable/equatable.dart';

import 'translation_entities.dart';

class NameEntities extends Equatable {
  final String short;
  final String long;
  final TranslationEntities translation;
  final TranslationEntities transliteration;

  const NameEntities({
    required this.short,
    required this.long,
    required this.translation,
    required this.transliteration,
  });

  @override
  List<Object> get props => [
        short,
        long,
        transliteration,
        translation,
      ];
}
