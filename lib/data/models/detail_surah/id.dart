import 'package:al_quran_app/domain/entities/surah_detail_entities.dart';
import 'package:equatable/equatable.dart';

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
