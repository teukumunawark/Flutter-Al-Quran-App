import 'package:equatable/equatable.dart';

import '../../../domain/entities/list_surah_entities/translation_entities.dart';

class TranslationModel extends Equatable {
  final String? en;
  final String? id;

  const TranslationModel({this.en, this.id});

  factory TranslationModel.fromJson(Map<String, dynamic> json) =>
      TranslationModel(
        en: json['en'],
        id: json['id'],
      );

  Map<String, dynamic> toJson() => {
        'en': en,
        'id': id,
      };

  TranslationEntities toEntity() => TranslationEntities(
        en: en as String,
        id: id as String,
      );

  @override
  List<Object?> get props => [en, id];
}
