import 'package:al_quran_app/domain/usecases/get_detail_surah.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../dummy_data/dummy_data_objects.dart';
import '../../helpers/test_helper.mocks.dart';

void main() {
  late GetDetailSurah usecase;
  late MockSurahRepository mockRepository;

  setUp(() {
    mockRepository = MockSurahRepository();
    usecase = GetDetailSurah(mockRepository);
  });

  const tId = 1;

  test("should get detail surah from the repository", () async {
    // arrange
    when(mockRepository.getDetailSurah(tId)).thenAnswer(
      (_) async => const Right(tDetailSurahEntities),
    );
    // act
    final result = await usecase.execute(tId);
    // assert
    expect(result, const Right(tDetailSurahEntities));
  });
}
