import 'package:equatable/equatable.dart';

import 'translation.dart';

class NameDetail extends Equatable {
  final String short;
  final String long;
  final TranslationDetail transliteration;
  final TranslationDetail translation;

  const NameDetail({
    required this.short,
    required this.long,
    required this.transliteration,
    required this.translation,
  });

  factory NameDetail.fromJson(Map<String, dynamic> json) => NameDetail(
        short: json['short'],
        long: json['long'],
        transliteration: TranslationDetail.fromJson(
          json['transliteration'] as Map<String, dynamic>,
        ),
        translation: TranslationDetail.fromJson(
          json['translation'] as Map<String, dynamic>,
        ),
      );

  Map<String, dynamic> toJson() => {
        'short': short,
        'long': long,
        'transliteration': transliteration.toJson(),
        'translation': translation.toJson(),
      };

  @override
  List<Object?> get props => [short, long, transliteration, translation];
}
