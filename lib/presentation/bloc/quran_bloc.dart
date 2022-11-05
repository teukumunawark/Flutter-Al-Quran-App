import 'package:al_quran_app/domain/entities/quran_entities.dart';
import 'package:al_quran_app/domain/usecases/get_surah_list.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'quran_event.dart';
part 'quran_state.dart';

class SurahListBloc extends Bloc<QuranEvent, QuranState> {
  final GetSurahList _getQuranList;

  SurahListBloc(this._getQuranList) : super(QuranLoading()) {
    on<OnQuranList>((event, emit) async {
      emit(QuranLoading());
      final result = await _getQuranList.execute();
      result.fold(
        (failure) => emit(QuranError(failure.message)),
        (data) => emit(QuranHasData(data)),
      );
    });
  }
}
