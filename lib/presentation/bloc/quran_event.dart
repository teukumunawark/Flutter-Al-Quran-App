part of 'quran_bloc.dart';

abstract class SurahEvent extends Equatable {
  const SurahEvent();

  @override
  List<Object> get props => [];
}

class OnQuranList extends SurahEvent {}

class OnDetailSurah extends SurahEvent {
  final int id;

  const OnDetailSurah(this.id);

  @override
  List<Object> get props => [id];
}
