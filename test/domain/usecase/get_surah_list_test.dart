import 'package:al_quran_app/domain/entities/quran_entities.dart';
import 'package:al_quran_app/domain/usecases/get_surah_list.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../helpers/test_helper.mocks.dart';

void main() {
  late GetSurahList usecase;
  late MockQuranRepository mockRepository;

  setUp(() {
    mockRepository = MockQuranRepository();
    usecase = GetSurahList(mockRepository);
  });

  final tSurah = <QuranEntities>[];

  test("description", () {});

  test("should get Popular TV Series from the repository", () async {
    // arrange
    when(mockRepository.getListQuran()).thenAnswer((_) async => Right(tSurah));
    // act
    final result = await usecase.execute();
    // assert
    expect(result, Right(tSurah));
  });
}
