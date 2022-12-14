part of 'quran_bloc.dart';

abstract class QuranState extends Equatable {
  const QuranState();

  @override
  List<Object> get props => [];
}

class QuranEmpty extends QuranState {}

class QuranLoading extends QuranState {}

class QuranError extends QuranState {
  final String message;

  const QuranError(this.message);

  @override
  List<Object> get props => [message];
}

class QuranHasData extends QuranState {
  final List<SurahEntities> listQuran;

  const QuranHasData(this.listQuran);

  @override
  List<Object> get props => [listQuran];
}
