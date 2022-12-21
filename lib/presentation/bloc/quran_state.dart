part of 'quran_bloc.dart';

abstract class SurahState extends Equatable {
  const SurahState();

  @override
  List<Object> get props => [];
}

class QuranEmpty extends SurahState {}

class QuranLoading extends SurahState {}

class QuranError extends SurahState {
  final String message;

  const QuranError(this.message);

  @override
  List<Object> get props => [message];
}

class QuranHasData extends SurahState {
  final List<SurahEntities> listQuran;

  const QuranHasData(this.listQuran);

  @override
  List<Object> get props => [listQuran];
}

class DetailSurahHasData extends SurahState {
  final DetailSurahEntities detailSurah;

  const DetailSurahHasData(this.detailSurah);

  @override
  List<Object> get props => [detailSurah];
}
