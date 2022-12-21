import 'package:al_quran_app/common/failure.dart';
import 'package:al_quran_app/domain/usecases/get_detail_surah.dart';
import 'package:al_quran_app/domain/usecases/get_surah_list.dart';
import 'package:al_quran_app/presentation/bloc/quran_bloc.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../dummy_data/dummy_data_objects.dart';
import 'quran_bloc_test.mocks.dart';

@GenerateMocks([
  GetSurahList,
  GetDetailSurah,
])
void main() {
  late SurahListBloc surahListBloc;
  late DetailSurahBloc detailSurahBloc;

  late MockGetSurahList mockGetQuranList;
  late MockGetDetailSurah mockGetDetailSurah;

  setUp(() {
    mockGetQuranList = MockGetSurahList();
    mockGetDetailSurah = MockGetDetailSurah();
    surahListBloc = SurahListBloc(mockGetQuranList);
    detailSurahBloc = DetailSurahBloc(mockGetDetailSurah);
  });
  group("List Surah", () {
    test(
      "Initial state should be Loading",
      () {
        expect(surahListBloc.state, QuranLoading());
      },
    );

    blocTest<SurahListBloc, SurahState>(
      "Should emit [Loading, HasData] when data is gotten successfully",
      build: () {
        when(mockGetQuranList.execute())
            .thenAnswer((_) async => Right(testQuranList));
        return surahListBloc;
      },
      act: (bloc) => bloc.add(OnQuranList()),
      expect: () => [
        QuranLoading(),
        QuranHasData(testQuranList),
      ],
      verify: (bloc) => verify(mockGetQuranList.execute()),
    );

    blocTest<SurahListBloc, SurahState>(
      "Should emit [Loading, Error] when get movie is unsuccessful",
      build: () {
        when(mockGetQuranList.execute())
            .thenAnswer((_) async => Left(ServerFailure("Server Failure")));
        return surahListBloc;
      },
      act: (bloc) => bloc.add(OnQuranList()),
      expect: () => [
        QuranLoading(),
        const QuranError("Server Failure"),
      ],
      verify: (bloc) => verify(mockGetQuranList.execute()),
    );
  });

  group("Detail Surah", () {
    const tId = 1;

    test(
      "Initial state should be Loading",
      () {
        expect(detailSurahBloc.state, QuranLoading());
      },
    );

    blocTest<DetailSurahBloc, SurahState>(
      "Should emit [Loading, HasData] when data is gotten successfully",
      build: () {
        when(mockGetDetailSurah.execute(tId))
            .thenAnswer((_) async => const Right(tDetailSurahEntities));
        return detailSurahBloc;
      },
      act: (bloc) => bloc.add(const OnDetailSurah(tId)),
      expect: () => [
        QuranLoading(),
        const DetailSurahHasData(tDetailSurahEntities),
      ],
    );

    blocTest<DetailSurahBloc, SurahState>(
      "Should emit [Loading, Error] when get movie is unsuccessful",
      build: () {
        when(mockGetDetailSurah.execute(tId))
            .thenAnswer((_) async => Left(ServerFailure("Server Failure")));
        return detailSurahBloc;
      },
      act: (bloc) => bloc.add(const OnDetailSurah(tId)),
      expect: () => [
        QuranLoading(),
        const QuranError("Server Failure"),
      ],
    );
  });
}
