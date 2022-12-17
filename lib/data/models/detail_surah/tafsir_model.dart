import 'package:al_quran_app/data/models/detail_surah/id_model.dart';
import 'package:equatable/equatable.dart';

import '../../../domain/entities/detail_surah_entities/id_entities.dart';
import '../../../domain/entities/detail_surah_entities/tafsir_entities.dart';

class TafsirID extends Equatable {
  final Id? id;

  const TafsirID({this.id});

  factory TafsirID.fromJson(Map<String, dynamic> json) => TafsirID(
        id: json['id'] == null
            ? null
            : Id.fromJson(json['id'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        'id': id,
      };

  TafsirIDEntities toEntity() => TafsirIDEntities(
        id: id?.toEntity() as IdEntities,
      );

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [id];
}
