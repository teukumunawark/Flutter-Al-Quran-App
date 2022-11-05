import 'package:equatable/equatable.dart';

class NumberDetail extends Equatable {
  final int inQuran;
  final int inSurah;

  const NumberDetail({required this.inQuran, required this.inSurah});

  factory NumberDetail.fromJson(Map<String, dynamic> json) => NumberDetail(
        inQuran: json['inQuran'],
        inSurah: json['inSurah'],
      );

  Map<String, dynamic> toJson() => {
        'inQuran': inQuran,
        'inSurah': inSurah,
      };

  @override
  List<Object?> get props => [inQuran, inSurah];
}
