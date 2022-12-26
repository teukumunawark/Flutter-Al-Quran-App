import 'package:al_quran_app/domain/entities/list_surah_entities/surah_entities.dart';
import 'package:al_quran_app/domain/usecases/get_surah_list.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../helpers/test_helper.mocks.dart';

void main() {
  late GetSurahList usecase;
  late MockSurahRepository mockRepository;

  setUp(() {
    mockRepository = MockSurahRepository();
    usecase = GetSurahList(mockRepository);
  });

  final tSurah = <SurahEntities>[];

  test("should get Popular TV Series from the repository", () async {
    // arrange
    when(mockRepository.getListSurah()).thenAnswer((_) async => Right(tSurah));
    // act
    final result = await usecase.execute();
    // assert
    expect(result, Right(tSurah));
  });
}
