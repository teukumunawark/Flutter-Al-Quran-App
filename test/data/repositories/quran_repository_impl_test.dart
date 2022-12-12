import 'dart:io';

import 'package:al_quran_app/common/exception.dart';
import 'package:al_quran_app/common/failure.dart';
import 'package:al_quran_app/data/models/quran_list_model.dart';
import 'package:al_quran_app/data/repositories/quran_repositories_impl.dart';
import 'package:al_quran_app/domain/entities/surah_list_entities.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../helpers/test_helper.mocks.dart';

void main() {
  late QuranRepositoryImpl repository;
  late MockQuranRemoteDataSource mockQuranRemoteDataSource;

  setUp(() {
    mockQuranRemoteDataSource = MockQuranRemoteDataSource();
    repository = QuranRepositoryImpl(
      remoteDataSource: mockQuranRemoteDataSource,
    );
  });

  const tSurahEntities = QuranEntities(
    number: 1,
    sequence: 5,
    numberOfVerses: 7,
    name: NameEntities(
      short: "الفاتحة",
      long: "سُورَةُ ٱلْفَاتِحَةِ",
      translation: TranslationEntities(
        en: "Al-Faatiha",
        id: "Al-Faatiha",
      ),
      transliteration: TranslationEntities(
        en: "Al-Faatiha",
        id: "Al-Faatiha",
      ),
    ),
    revelation: RevelationEntities(
      arab: "مكة",
      en: "Meccan",
      id: "Makkiyyah",
    ),
    tafsir: TafsirEntities(
      id: "Surat Al Faatihah (Pembukaan) yang diturunkan di Mekah dan terdiri dari 7 ayat adalah surat yang pertama-tama diturunkan dengan lengkap  diantara surat-surat yang ada dalam Al Quran dan termasuk golongan surat Makkiyyah. Surat ini disebut Al Faatihah (Pembukaan), karena dengan surat inilah dibuka dan dimulainya Al Quran. Dinamakan Ummul Quran (induk Al Quran) atau Ummul Kitaab (induk Al Kitaab) karena dia merupakan induk dari semua isi Al Quran, dan karena itu diwajibkan membacanya pada tiap-tiap sembahyang. Dinamakan pula As Sab'ul matsaany (tujuh yang berulang-ulang) karena ayatnya tujuh dan dibaca berulang-ulang dalam sholat.",
    ),
  );

  const tSurahModel = QuranModel(
    number: 1,
    sequence: 5,
    numberOfVerses: 7,
    name: Name(
      short: "الفاتحة",
      long: "سُورَةُ ٱلْفَاتِحَةِ",
      translation: Translation(
        en: "Al-Faatiha",
        id: "Al-Faatiha",
      ),
      transliteration: Translation(
        en: "Al-Faatiha",
        id: "Al-Faatiha",
      ),
    ),
    revelation: Revelation(
      arab: "مكة",
      en: "Meccan",
      id: "Makkiyyah",
    ),
    tafsir: Tafsir(
      id: "Surat Al Faatihah (Pembukaan) yang diturunkan di Mekah dan terdiri dari 7 ayat adalah surat yang pertama-tama diturunkan dengan lengkap  diantara surat-surat yang ada dalam Al Quran dan termasuk golongan surat Makkiyyah. Surat ini disebut Al Faatihah (Pembukaan), karena dengan surat inilah dibuka dan dimulainya Al Quran. Dinamakan Ummul Quran (induk Al Quran) atau Ummul Kitaab (induk Al Kitaab) karena dia merupakan induk dari semua isi Al Quran, dan karena itu diwajibkan membacanya pada tiap-tiap sembahyang. Dinamakan pula As Sab'ul matsaany (tujuh yang berulang-ulang) karena ayatnya tujuh dan dibaca berulang-ulang dalam sholat.",
    ),
  );

  final tSurahEntityList = <QuranEntities>[tSurahEntities];
  final tSurahModelList = <QuranModel>[tSurahModel];

  group("Surah List", () {
    test(
        "should return remote data when the call to remote data source is successful",
        () async {
      // arrange
      when(mockQuranRemoteDataSource.getListQuran())
          .thenAnswer((_) async => tSurahModelList);
      // act
      final result = await repository.getListQuran();
      // assert
      verify(mockQuranRemoteDataSource.getListQuran());
      final resultList = result.getOrElse(() => []);
      expect(resultList, tSurahEntityList);
    });
    test(
        "should return server failure when the call to remote data source is unsuccessful",
        () async {
      // arrange
      when(mockQuranRemoteDataSource.getListQuran())
          .thenThrow(ServerException());
      // act
      final result = await repository.getListQuran();
      // assert
      verify(mockQuranRemoteDataSource.getListQuran());
      expect(result, equals(Left(ServerFailure(''))));
    });
    test(
        "should return connection failure when the device is not connected to internet",
        () async {
      // arrange
      when(mockQuranRemoteDataSource.getListQuran())
          .thenThrow(const SocketException('Failed to connect to the network'));
      // act
      final result = await repository.getListQuran();
      // assert
      verify(mockQuranRemoteDataSource.getListQuran());
      expect(result,
          equals(Left(ConnectionFailure('Failed to connect to the network'))));
    });
  });
}
