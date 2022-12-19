import 'package:al_quran_app/domain/usecases/get_detail_surah.dart';
import 'package:al_quran_app/domain/usecases/get_surah_list.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/entities/list_surah_entities/surah_entities.dart';

part 'quran_event.dart';
part 'quran_state.dart';

class SurahListBloc extends Bloc<SurahEvent, SurahState> {
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

class DetailSurahBloc extends Bloc<SurahEvent, SurahState> {
  final GetDetailSurah _getDetailSurah;

  DetailSurahBloc(this._getDetailSurah) : super(QuranLoading()) {
    on<OnDetailSurah>((event, emit) async {
      final id = event.id;

      emit(QuranLoading());

      final result = await _getDetailSurah.execute(id);
      result.fold(
        (l) => null,
        (r) => null,
      );
    });
  }
}
