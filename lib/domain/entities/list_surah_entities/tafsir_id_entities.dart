import 'package:equatable/equatable.dart';

class TafsirEntities extends Equatable {
  final String id;

  const TafsirEntities({required this.id});

  @override
  List<Object> get props => [id];
}
