import 'package:equatable/equatable.dart';

class SajdaEntities extends Equatable {
  final bool? recommended;
  final bool? obligatory;

  const SajdaEntities({this.recommended, this.obligatory});

  @override
  List<Object?> get props => [recommended, obligatory];
}
