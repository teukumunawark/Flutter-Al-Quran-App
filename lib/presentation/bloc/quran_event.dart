part of 'quran_bloc.dart';

abstract class QuranEvent extends Equatable {
  const QuranEvent();

  @override
  List<Object> get props => [];
}

class OnSurahList extends QuranEvent {}

class OnJuzList extends QuranEvent {}

class OnDetailSurah extends QuranEvent {
  final String id;

  const OnDetailSurah(this.id);

  @override
  List<Object> get props => [id];
}

class OnDetailJuz extends QuranEvent {
  final String id;

  const OnDetailJuz(this.id);

  @override
  List<Object> get props => [id];
}
