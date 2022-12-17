import 'package:equatable/equatable.dart';

class IdEntities extends Equatable {
  final String? short;
  final String? long;

  const IdEntities({this.short, this.long});

  @override
  List<Object?> get props => [short, long];
}
