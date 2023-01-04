import 'package:equatable/equatable.dart';

import 'translation_entities.dart';

class NameEntities extends Equatable {
  final String? short;
  final String? long;
  final TranslationEntities? translation;
  final TranslationEntities? transliteration;

  const NameEntities({
    this.short,
    this.long,
    this.translation,
    this.transliteration,
  });

  @override
  List<Object?> get props => [
        short,
        long,
        transliteration,
        translation,
      ];
}
