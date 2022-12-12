import 'package:equatable/equatable.dart';

import 'translation.dart';
import 'transliteration.dart';

class Name extends Equatable {
  final String? short;
  final String? long;
  final Transliteration? transliteration;
  final Translation? translation;

  const Name({
    this.short,
    this.long,
    this.transliteration,
    this.translation,
  });

  factory Name.fromJson(Map<String, dynamic> json) => Name(
        short: json['short'] as String?,
        long: json['long'] as String?,
        transliteration: json['transliteration'] == null
            ? null
            : Transliteration.fromJson(
                json['transliteration'] as Map<String, dynamic>),
        translation: json['translation'] == null
            ? null
            : Translation.fromJson(json['translation'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        'short': short,
        'long': long,
        'transliteration': transliteration?.toJson(),
        'translation': translation?.toJson(),
      };

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [
        short,
        long,
        transliteration,
        translation,
      ];
}
