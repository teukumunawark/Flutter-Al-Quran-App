import 'package:al_quran_app/data/models/list_surah_models/translation_model.dart';
import 'package:al_quran_app/domain/entities/surah_detail_entities.dart';
import 'package:equatable/equatable.dart';

class Text extends Equatable {
  final String? arab;
  final TranslationModel? transliteration;

  const Text({this.arab, this.transliteration});

  factory Text.fromJson(Map<String, dynamic> json) => Text(
        arab: json['arab'] as String?,
        transliteration: json['transliteration'] == null
            ? null
            : TranslationModel.fromJson(
                json['transliteration'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        'arab': arab,
        'transliteration': transliteration?.toJson(),
      };

  TextEntities toEntity() => TextEntities(
        arab: arab,
        transliteration: transliteration?.toEntity() as TransliterationEntities,
      );

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [arab, transliteration];
}
