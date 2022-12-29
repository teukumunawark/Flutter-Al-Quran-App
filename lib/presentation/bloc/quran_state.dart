part of 'quran_bloc.dart';

abstract class SurahState extends Equatable {
  const SurahState();

  @override
  List<Object> get props => [];
}

class SurahEmpty extends SurahState {}

class SurahLoading extends SurahState {}

class SurahError extends SurahState {
  final String message;

  const SurahError(this.message);

  @override
  List<Object> get props => [message];
}

class SurahHasData extends SurahState {
  final List<SurahEntities> listQuran;

  const SurahHasData(this.listQuran);

  @override
  List<Object> get props => [listQuran];
}

class DetailSurahHasData extends SurahState {
  final DetailSurahEntities detailSurah;

  const DetailSurahHasData(this.detailSurah);

  @override
  List<Object> get props => [detailSurah];
}
