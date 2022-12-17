import 'package:equatable/equatable.dart';

import '../list_surah_entities/translation_entities.dart';

class TextEntities extends Equatable {
  final String? arab;
  final TranslationEntities? transliteration;

  const TextEntities({this.arab, this.transliteration});

  @override
  List<Object?> get props => [arab, transliteration];
}
