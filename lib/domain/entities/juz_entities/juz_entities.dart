import 'package:equatable/equatable.dart';

class JuzEntities extends Equatable {
  final int? juz;
  final int? juzStartSurahNumber;
  final int? juzEndSurahNumber;
  final int? totalVerses;
  final String? juzStartInfo;
  final String? juzEndInfo;

  const JuzEntities({
    this.juz,
    this.juzStartSurahNumber,
    this.juzEndSurahNumber,
    this.totalVerses,
    this.juzStartInfo,
    this.juzEndInfo,
  });

  @override
  List<Object?> get props => [
        juz,
        juzStartSurahNumber,
        juzEndSurahNumber,
        totalVerses,
        juzStartInfo,
        juzEndInfo,
      ];
}
