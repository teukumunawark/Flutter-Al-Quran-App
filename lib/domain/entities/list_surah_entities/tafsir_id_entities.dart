import 'package:equatable/equatable.dart';

class TafsirIDEntities extends Equatable {
  final String id;

  const TafsirIDEntities({required this.id});

  @override
  List<Object> get props => [id];
}
