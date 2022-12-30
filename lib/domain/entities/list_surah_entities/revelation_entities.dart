import 'package:equatable/equatable.dart';

class RevelationEntities extends Equatable {
  final String? arab;
  final String? en;
  final String? id;

  const RevelationEntities({
    this.arab,
    this.en,
    this.id,
  });

  @override
  List<Object?> get props => [
        arab,
        en,
        id,
      ];
}
