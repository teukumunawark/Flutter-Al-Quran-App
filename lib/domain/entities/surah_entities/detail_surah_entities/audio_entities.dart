import 'package:equatable/equatable.dart';

class AudioEntities extends Equatable {
  final String? primary;
  final List<String>? secondary;

  const AudioEntities({this.primary, this.secondary});

  @override
  List<Object?> get props => [primary, secondary];
}
