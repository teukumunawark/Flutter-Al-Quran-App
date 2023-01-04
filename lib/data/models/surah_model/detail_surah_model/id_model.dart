import 'package:equatable/equatable.dart';

import '../../../../domain/entities/surah_entities/detail_surah_entities/id_entities.dart';

class Id extends Equatable {
  final String? short;
  final String? long;

  const Id({this.short, this.long});

  factory Id.fromJson(Map<String, dynamic> json) => Id(
        short: json['short'] as String?,
        long: json['long'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'short': short,
        'long': long,
      };

  IdEntities toEntity() => IdEntities(
        long: long,
        short: short,
      );

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [short, long];
}
