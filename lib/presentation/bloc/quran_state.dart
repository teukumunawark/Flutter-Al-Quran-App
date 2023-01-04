part of 'quran_bloc.dart';

abstract class QuranState extends Equatable {
  const QuranState();

  @override
  List<Object> get props => [];
}

class SurahEmpty extends QuranState {}

class QuranLoading extends QuranState {}

class QuranError extends QuranState {
  final String message;

  const QuranError(this.message);

  @override
  List<Object> get props => [message];
}

class SurahHasData extends QuranState {
  final List<SurahEntities> surahList;

  const SurahHasData(this.surahList);

  @override
  List<Object> get props => [surahList];
}

class JuzHasData extends QuranState {
  final List<JuzEntities> juzList;

  const JuzHasData(this.juzList);

  @override
  List<Object> get props => [juzList];
}

class DetailSurahHasData extends QuranState {
  final DetailSurahEntities detailSurah;

  const DetailSurahHasData(this.detailSurah);

  @override
  List<Object> get props => [detailSurah];
}

class DetailJuzHasData extends QuranState {
  final DetailJuzEntities detailJuz;

  const DetailJuzHasData(this.detailJuz);

  @override
  List<Object> get props => [detailJuz];
}

class JadwalHasData extends QuranState {
  final List<JadwalEntities> jadwal;

  const JadwalHasData(this.jadwal);

  @override
  List<Object> get props => [jadwal];
}
