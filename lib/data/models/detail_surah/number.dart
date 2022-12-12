import 'package:equatable/equatable.dart';

class Number extends Equatable {
  final int? inQuran;
  final int? inSurah;

  const Number({this.inQuran, this.inSurah});

  factory Number.fromJson(Map<String, dynamic> json) => Number(
        inQuran: json['inQuran'] as int?,
        inSurah: json['inSurah'] as int?,
      );

  Map<String, dynamic> toJson() => {
        'inQuran': inQuran,
        'inSurah': inSurah,
      };

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [inQuran, inSurah];
}
