import 'package:al_quran_app/domain/entities/detail_surah_entities/detail_surah_entities.dart';
import 'package:al_quran_app/domain/entities/list_juz_entities/juz_entities.dart';
import 'package:al_quran_app/domain/usecases/get_detail_surah.dart';
import 'package:al_quran_app/domain/usecases/get_juz_list.dart';
import 'package:al_quran_app/domain/usecases/get_surah_list.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/entities/list_surah_entities/surah_entities.dart';

part 'quran_event.dart';
part 'quran_state.dart';

class SurahListBloc extends Bloc<QuranEvent, QuranState> {
  final GetSurahList _getQuranList;

  SurahListBloc(this._getQuranList) : super(QuranLoading()) {
    on<OnSurahList>((event, emit) async {
      emit(QuranLoading());
      final result = await _getQuranList.execute();
      result.fold(
        (failure) => emit(SurahError(failure.message)),
        (data) => emit(SurahHasData(data)),
      );
    });
  }
}

class JuzListBloc extends Bloc<QuranEvent, QuranState> {
  final GetJuzList _getJuzList;

  JuzListBloc(this._getJuzList) : super(QuranLoading()) {
    on<OnJuzList>((event, emit) async {
      emit(QuranLoading());
      final result = await _getJuzList.execute();
      result.fold(
        (failure) => emit(SurahError(failure.message)),
        (data) => emit(JuzHasData(data)),
      );
    });
  }
}

class DetailSurahBloc extends Bloc<QuranEvent, QuranState> {
  final GetDetailSurah _getDetailSurah;

  DetailSurahBloc(this._getDetailSurah) : super(QuranLoading()) {
    on<OnDetailSurah>((event, emit) async {
      final id = event.id;

      emit(QuranLoading());

      final result = await _getDetailSurah.execute(id);
      result.fold(
        (failure) => emit(SurahError(failure.message)),
        (data) => emit(DetailSurahHasData(data)),
      );
    });
  }
}
