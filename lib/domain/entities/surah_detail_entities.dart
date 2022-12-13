import 'package:equatable/equatable.dart';

class DetailSurahEntities extends Equatable {
  final int? number;
  final int? sequence;
  final int? numberOfVerses;
  final NameEntities? name;
  final RevelationEntities? revelation;
  final TafsirEntities? tafsir;
  final PreBismillahEntities? preBismillah;
  final List<VerseEntities>? verses;

  const DetailSurahEntities({
    this.number,
    this.sequence,
    this.numberOfVerses,
    this.name,
    this.revelation,
    this.tafsir,
    this.preBismillah,
    this.verses,
  });

  @override
  List<Object?> get props => [
        number,
        sequence,
        numberOfVerses,
        name,
        revelation,
        tafsir,
        preBismillah,
        verses,
      ];
}

class NameEntities extends Equatable {
  final String? short;
  final String? long;
  final TransliterationEntities? transliteration;
  final TranslationEntities? translation;

  const NameEntities({
    this.short,
    this.long,
    this.transliteration,
    this.translation,
  });

  @override
  List<Object?> get props => [
        short,
        long,
        transliteration,
        translation,
      ];
}

class TransliterationEntities extends Equatable {
  final String? en;
  final String? id;

  const TransliterationEntities({
    this.en,
    this.id,
  });

  @override
  List<Object?> get props => [en, id];
}

class TranslationEntities extends Equatable {
  final String? en;
  final String? id;

  const TranslationEntities({this.en, this.id});

  @override
  List<Object?> get props => [en, id];
}

class RevelationEntities extends Equatable {
  final String? arab;
  final String? en;
  final String? id;

  const RevelationEntities({
    this.arab,
    this.en,
    this.id,
  });

  @override
  List<Object?> get props => [
        arab,
        en,
        id,
      ];
}

class IdEntities extends Equatable {
  final String? short;
  final String? long;

  const IdEntities({this.short, this.long});

  @override
  List<Object?> get props => [short, long];
}

class TafsirEntities extends Equatable {
  final IdEntities? id;

  const TafsirEntities({this.id});

  @override
  List<Object?> get props => [id];
}

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

class AudioEntities extends Equatable {
  final String? primary;
  final List<String>? secondary;

  const AudioEntities({this.primary, this.secondary});

  @override
  List<Object?> get props => [primary, secondary];
}

class TextEntities extends Equatable {
  final String? arab;
  final TransliterationEntities? transliteration;

  const TextEntities({this.arab, this.transliteration});

  @override
  List<Object?> get props => [arab, transliteration];
}

class VerseEntities extends Equatable {
  final NumberEntities? number;
  final MetaEntities? meta;
  final TextEntities? text;
  final TranslationEntities? translation;
  final AudioEntities? audio;
  final TafsirEntities? tafsir;

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

class NumberEntities extends Equatable {
  final int? inQuran;
  final int? inSurah;

  const NumberEntities({this.inQuran, this.inSurah});

  @override
  List<Object?> get props => [inQuran, inSurah];
}

class MetaEntities extends Equatable {
  final int? juz;
  final int? page;
  final int? manzil;
  final int? ruku;
  final int? hizbQuarter;
  final SajdaEntities? sajda;

  const MetaEntities({
    this.juz,
    this.page,
    this.manzil,
    this.ruku,
    this.hizbQuarter,
    this.sajda,
  });

  @override
  List<Object?> get props => [
        juz,
        page,
        manzil,
        ruku,
        hizbQuarter,
        sajda,
      ];
}

class SajdaEntities extends Equatable {
  final bool? recommended;
  final bool? obligatory;

  const SajdaEntities({this.recommended, this.obligatory});

  @override
  List<Object?> get props => [recommended, obligatory];
}
