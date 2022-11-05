import 'package:al_quran_app/data/models/detail_surah_models/translation.dart';
import 'package:equatable/equatable.dart';

class TextDetail extends Equatable {
  final String arab;
  final TranslationDetail transliteration;

  const TextDetail({required this.arab, required this.transliteration});

  factory TextDetail.fromJson(Map<String, dynamic> json) => TextDetail(
        arab: json['arab'],
        transliteration: TranslationDetail.fromJson(
            json['transliteration'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        'arab': arab,
        'transliteration': transliteration.toJson(),
      };

  @override
  List<Object?> get props => [arab, transliteration];
}
