import 'package:al_quran_app/domain/entities/surah_entities/detail_surah_entities/id_entities.dart';
import 'package:equatable/equatable.dart';

class TafsirIDEntities extends Equatable {
  final IdEntities? id;

  const TafsirIDEntities({this.id});

  @override
  List<Object?> get props => [id];
}
