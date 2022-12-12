import 'package:al_quran_app/common/failure.dart';
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
])
void main() {
  late SurahListBloc surahListBloc;
  late MockGetSurahList mockGetQuranList;

  setUp(() {
    mockGetQuranList = MockGetSurahList();
    surahListBloc = SurahListBloc(mockGetQuranList);
  });
  test("Initial state should be Loading", () {
    expect(surahListBloc.state, QuranLoading());
  });

  blocTest<SurahListBloc, QuranState>(
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

  blocTest<SurahListBloc, QuranState>(
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
}
