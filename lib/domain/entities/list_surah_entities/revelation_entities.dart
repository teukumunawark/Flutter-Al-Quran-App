import 'package:equatable/equatable.dart';

class RevelationEntities extends Equatable {
  final String arab;
  final String en;
  final String id;

  const RevelationEntities({
    required this.arab,
    required this.en,
    required this.id,
  });

  @override
  List<Object> get props => [
        arab,
        en,
        id,
      ];
}
