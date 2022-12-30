import 'package:equatable/equatable.dart';

import '../../../domain/entities/list_surah_entities/revelation_entities.dart';

class RevelationModel extends Equatable {
  final String? arab;
  final String? en;
  final String? id;

  const RevelationModel({
    this.arab,
    this.en,
    this.id,
  });

  factory RevelationModel.fromJson(Map<String, dynamic> json) =>
      RevelationModel(
        arab: json['arab'],
        en: json['en'],
        id: json['id'],
      );

  Map<String, dynamic> toJson() => {
        'arab': arab,
        'en': en,
        'id': id,
      };

  RevelationEntities toEntity() => RevelationEntities(
        arab: arab,
        en: en,
        id: id,
      );

  @override
  List<Object?> get props => [arab, en, id];
}
