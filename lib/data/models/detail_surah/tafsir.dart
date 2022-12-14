import 'package:al_quran_app/data/models/detail_surah/id.dart';
import 'package:al_quran_app/domain/entities/surah_detail_entities.dart';
import 'package:equatable/equatable.dart';

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
