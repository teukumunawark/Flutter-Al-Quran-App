import 'package:equatable/equatable.dart';

class NumberEntities extends Equatable {
  final int? inQuran;
  final int? inSurah;

  const NumberEntities({this.inQuran, this.inSurah});

  @override
  List<Object?> get props => [inQuran, inSurah];
}
