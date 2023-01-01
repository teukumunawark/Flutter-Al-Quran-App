part of 'quran_bloc.dart';

abstract class QuranEvent extends Equatable {
  const QuranEvent();

  @override
  List<Object> get props => [];
}

class OnSurahList extends QuranEvent {}

class OnJuzList extends QuranEvent {}

class OnDetailSurah extends QuranEvent {
  final int id;

  const OnDetailSurah(this.id);

  @override
  List<Object> get props => [id];
}
