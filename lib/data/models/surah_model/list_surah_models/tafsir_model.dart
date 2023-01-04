import 'package:equatable/equatable.dart';

import '../../../../domain/entities/surah_entities/list_surah_entities/tafsir_id_entities.dart';

class TafsirModel extends Equatable {
  final String? id;

  const TafsirModel({required this.id});

  factory TafsirModel.fromJson(Map<String, dynamic> json) => TafsirModel(
        id: json['id'],
      );

  Map<String, dynamic> toJson() => {
        'id': id,
      };

  TafsirEntities toEntity() => TafsirEntities(id: id);

  @override
  List<Object?> get props => [id];
}
