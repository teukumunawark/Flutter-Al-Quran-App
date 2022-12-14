import 'dart:io';

import 'package:al_quran_app/common/exception.dart';
import 'package:al_quran_app/common/failure.dart';
import 'package:al_quran_app/data/models/surah_model/detail_surah_model/audio_model.dart';
import 'package:al_quran_app/data/models/surah_model/detail_surah_model/detail_surah_model.dart';
import 'package:al_quran_app/data/models/surah_model/detail_surah_model/id_model.dart';
import 'package:al_quran_app/data/models/surah_model/detail_surah_model/meta_model.dart';
import 'package:al_quran_app/data/models/surah_model/detail_surah_model/number_model.dart';
import 'package:al_quran_app/data/models/surah_model/detail_surah_model/pre_bismillah_model.dart';
import 'package:al_quran_app/data/models/surah_model/detail_surah_model/sajda_nodel.dart';
import 'package:al_quran_app/data/models/surah_model/detail_surah_model/tafsir_model.dart';
import 'package:al_quran_app/data/models/surah_model/detail_surah_model/text_model.dart';
import 'package:al_quran_app/data/models/surah_model/detail_surah_model/verse_model.dart';
import 'package:al_quran_app/data/models/surah_model/list_surah_models/name_model.dart';
import 'package:al_quran_app/data/models/surah_model/list_surah_models/revalation_model.dart';
import 'package:al_quran_app/data/models/surah_model/list_surah_models/surah_model.dart';
import 'package:al_quran_app/data/models/surah_model/list_surah_models/tafsir_model.dart';
import 'package:al_quran_app/data/models/surah_model/list_surah_models/translation_model.dart';
import 'package:al_quran_app/data/repositories/quran_repositories_impl.dart';
import 'package:al_quran_app/domain/entities/surah_entities/list_surah_entities/name_entities.dart';
import 'package:al_quran_app/domain/entities/surah_entities/list_surah_entities/revelation_entities.dart';
import 'package:al_quran_app/domain/entities/surah_entities/list_surah_entities/surah_entities.dart';
import 'package:al_quran_app/domain/entities/surah_entities/list_surah_entities/tafsir_id_entities.dart';
import 'package:al_quran_app/domain/entities/surah_entities/list_surah_entities/translation_entities.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../dummy_data/dummy_data_objects.dart';
import '../../helpers/test_helper.mocks.dart';

void main() {
  late SurahRepositoryImpl repository;
  late MockSurahRemoteDataSource mockSurahRemoteDataSource;

  setUp(() {
    mockSurahRemoteDataSource = MockSurahRemoteDataSource();
    repository = SurahRepositoryImpl(
      remoteDataSource: mockSurahRemoteDataSource,
    );
  });

  const tSurahEntities = SurahEntities(
    number: 1,
    sequence: 5,
    numberOfVerses: 7,
    name: NameEntities(
      short: "??????????????",
      long: "?????????????? ????????????????????????",
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
      arab: "??????",
      en: "Meccan",
      id: "Makkiyyah",
    ),
    tafsir: TafsirEntities(
      id: "Surat Al Faatihah (Pembukaan) yang diturunkan di Mekah dan terdiri dari 7 ayat adalah surat yang pertama-tama diturunkan dengan lengkap  diantara surat-surat yang ada dalam Al Quran dan termasuk golongan surat Makkiyyah. Surat ini disebut Al Faatihah (Pembukaan), karena dengan surat inilah dibuka dan dimulainya Al Quran. Dinamakan Ummul Quran (induk Al Quran) atau Ummul Kitaab (induk Al Kitaab) karena dia merupakan induk dari semua isi Al Quran, dan karena itu diwajibkan membacanya pada tiap-tiap sembahyang. Dinamakan pula As Sab'ul matsaany (tujuh yang berulang-ulang) karena ayatnya tujuh dan dibaca berulang-ulang dalam sholat.",
    ),
  );

  const tSurahModel = SurahModel(
    number: 1,
    sequence: 5,
    numberOfVerses: 7,
    name: NameModel(
      short: "??????????????",
      long: "?????????????? ????????????????????????",
      translation: TranslationModel(
        en: "Al-Faatiha",
        id: "Al-Faatiha",
      ),
      transliteration: TranslationModel(
        en: "Al-Faatiha",
        id: "Al-Faatiha",
      ),
    ),
    revelation: RevelationModel(
      arab: "??????",
      en: "Meccan",
      id: "Makkiyyah",
    ),
    tafsir: TafsirModel(
      id: "Surat Al Faatihah (Pembukaan) yang diturunkan di Mekah dan terdiri dari 7 ayat adalah surat yang pertama-tama diturunkan dengan lengkap  diantara surat-surat yang ada dalam Al Quran dan termasuk golongan surat Makkiyyah. Surat ini disebut Al Faatihah (Pembukaan), karena dengan surat inilah dibuka dan dimulainya Al Quran. Dinamakan Ummul Quran (induk Al Quran) atau Ummul Kitaab (induk Al Kitaab) karena dia merupakan induk dari semua isi Al Quran, dan karena itu diwajibkan membacanya pada tiap-tiap sembahyang. Dinamakan pula As Sab'ul matsaany (tujuh yang berulang-ulang) karena ayatnya tujuh dan dibaca berulang-ulang dalam sholat.",
    ),
  );

  final tSurahEntityList = <SurahEntities>[tSurahEntities];
  final tSurahModelList = <SurahModel>[tSurahModel];

  group("Surah List", () {
    test(
        "should return remote data when the call to remote data source is successful",
        () async {
      // arrange
      when(mockSurahRemoteDataSource.getListSurah())
          .thenAnswer((_) async => tSurahModelList);
      // act
      final result = await repository.getListSurah();
      // assert
      verify(mockSurahRemoteDataSource.getListSurah());
      final resultList = result.getOrElse(() => []);
      expect(resultList, tSurahEntityList);
    });
    test(
        "should return server failure when the call to remote data source is unsuccessful",
        () async {
      // arrange
      when(mockSurahRemoteDataSource.getListSurah())
          .thenThrow(ServerException());
      // act
      final result = await repository.getListSurah();
      // assert
      verify(mockSurahRemoteDataSource.getListSurah());
      expect(result, equals(Left(ServerFailure(''))));
    });
    test(
        "should return connection failure when the device is not connected to internet",
        () async {
      // arrange
      when(mockSurahRemoteDataSource.getListSurah())
          .thenThrow(const SocketException('Failed to connect to the network'));
      // act
      final result = await repository.getListSurah();
      // assert
      verify(mockSurahRemoteDataSource.getListSurah());
      expect(result,
          equals(Left(ConnectionFailure('Failed to connect to the network'))));
    });
  });

  group(
    "Get Surah Detail",
    () {
      const tId = 110;
      const tDetailSurahModel = DetailSurah(
        number: 110,
        sequence: 114,
        numberOfVerses: 3,
        name: NameModel(
          short: "??????????",
          long: "???????? ??????????",
          transliteration: TranslationModel(
            en: "An-Nasr",
            id: "An-Nasr",
          ),
          translation: TranslationModel(
            en: "Divine Support",
            id: "Pertolongan",
          ),
        ),
        revelation: RevelationModel(
          arab: "??????????",
          en: "Medinan",
          id: "Madaniyyah",
        ),
        tafsir: TafsirModel(
          id: "Surat An Nashr terdiri atas 3 ayat, termasuk golongan surat-surat  Madaniyyah yang diturunkan di Mekah sesudah surat At Taubah.  Dinamai An Nashr (pertolongan) diambil dari perkataan Nashr yang  terdapat pada ayat pertama surat ini.",
        ),
        preBismillah: PreBismillahModel(
          text: TextModel(
            arab: "???????????? ?????????????? ???????????????????????? ????????????????????",
            transliteration: TranslationModel(
              en: "Bismillaahir Rahmaanir Raheem",
            ),
          ),
          translation: TranslationModel(
            en: "In the name of Allah, the Entirely Merciful, the Especially Merciful.",
            id: "Dengan nama Allah Yang Maha Pengasih, Maha Penyayang.",
          ),
          audio: Audio(
            primary: "https://cdn.alquran.cloud/media/audio/ayah/ar.alafasy/1",
            secondary: [
              "https://cdn.islamic.network/quran/audio/128/ar.alafasy/1.mp3",
              "https://cdn.islamic.network/quran/audio/64/ar.alafasy/1.mp3",
            ],
          ),
        ),
        verses: [
          VerseModel(
            number: Number(inQuran: 6214, inSurah: 1),
            meta: Meta(
              juz: 30,
              page: 603,
              manzil: 7,
              ruku: 552,
              hizbQuarter: 240,
              sajda: Sajda(recommended: false, obligatory: false),
            ),
            text: TextModel(
              arab: "?????????? ?????????? ???????????? ?????????????? ??????????????????????",
              transliteration: TranslationModel(
                en: "Iza jaa-a nas rullahi walfath",
              ),
            ),
            translation: TranslationModel(
              en: "When the victory of Allah has come and the conquest,",
              id: "Apabila telah datang pertolongan Allah dan kemenangan,",
            ),
            audio: Audio(
              primary:
                  "https://cdn.alquran.cloud/media/audio/ayah/ar.alafasy/1",
              secondary: [
                "https://cdn.islamic.network/quran/audio/128/ar.alafasy/1.mp3",
                "https://cdn.islamic.network/quran/audio/64/ar.alafasy/1.mp3",
              ],
            ),
            tafsir: TafsirID(
              id: Id(
                short:
                    "Wahai Nabi Muhammad, apabila telah datang pertolongan Allah kepadamu dan pengikutmu dalam menghadapi kaum kafir Quraisy, dan telah datang pula kemenangan kepadamu dengan penaklukan Mekah menjadi kota yang suci kembali dari kesyirikan dan kekafiran,",
                long:
                    "Dalam ayat-ayat ini, Allah memerintahkan apa yang harus dilakukan Nabi Muhammad pada saat pembebasan Mekah, yaitu apabila ia telah melihat pertolongan Allah terhadap agama-Nya telah tiba, dengan kekalahan orang-orang musyrik dan kemenangan di pihak Nabi, dan melihat pula orang-orang masuk agama Allah beramai-ramai dan berduyun-duyun, bukan perseorangan sebagaimana halnya pada permulaan dakwah.\n\nOrang-orang Arab berkata, \"Manakala Muhammad menang atas penduduk Mekah yang mana Allah telah selamatkan mereka dari pasukan bergajah, maka kalian tidak berdaya melawannya.\" Akhirnya mereka masuk Islam berduyun-duyun, berkelompok-kelompok dan satu kelompok 40 orang.",
              ),
            ),
          ),
        ],
      );
      test(
          "should return Surah data when the call to remote data source is successful",
          () async {
        // arrange
        when(mockSurahRemoteDataSource.getDetailSurah(tId))
            .thenAnswer((_) async => tDetailSurahModel);
        // act
        final result = await repository.getDetailSurah(tId);
        // assert
        verify(mockSurahRemoteDataSource.getDetailSurah(tId));
        expect(result, equals(const Right(tDetailSurahEntities)));
      });
    },
  );
}
