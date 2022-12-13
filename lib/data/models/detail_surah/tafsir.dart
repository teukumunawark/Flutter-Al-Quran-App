import 'package:al_quran_app/data/models/detail_surah/id.dart';
import 'package:equatable/equatable.dart';

class Tafsir extends Equatable {
  final Id? id;

  const Tafsir({this.id});

  factory Tafsir.fromJson(Map<String, dynamic> json) => Tafsir(
        id: json['id'] == null
            ? null
            : Id.fromJson(json['id'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        'id': id,
      };

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [id];
}
