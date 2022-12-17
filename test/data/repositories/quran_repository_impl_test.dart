import 'dart:io';

import 'package:al_quran_app/common/exception.dart';
import 'package:al_quran_app/common/failure.dart';
import 'package:al_quran_app/data/models/detail_surah/audio_model.dart';
import 'package:al_quran_app/data/models/detail_surah/detail_surah_model.dart';
import 'package:al_quran_app/data/models/detail_surah/id_model.dart';
import 'package:al_quran_app/data/models/detail_surah/meta_model.dart';
import 'package:al_quran_app/data/models/detail_surah/number_model.dart';
import 'package:al_quran_app/data/models/detail_surah/pre_bismillah_model.dart';
import 'package:al_quran_app/data/models/detail_surah/sajda_nodel.dart';
import 'package:al_quran_app/data/models/detail_surah/tafsir_model.dart';
import 'package:al_quran_app/data/models/detail_surah/text_model.dart';
import 'package:al_quran_app/data/models/detail_surah/verse_model.dart';
import 'package:al_quran_app/data/models/list_surah_models/name_model.dart';
import 'package:al_quran_app/data/models/list_surah_models/revalation_model.dart';
import 'package:al_quran_app/data/models/list_surah_models/surah_model.dart';
import 'package:al_quran_app/data/models/list_surah_models/tafsir_model.dart';
import 'package:al_quran_app/data/models/list_surah_models/translation_model.dart';
import 'package:al_quran_app/data/repositories/quran_repositories_impl.dart';
import 'package:al_quran_app/domain/entities/list_surah_entities/name_entities.dart';
import 'package:al_quran_app/domain/entities/list_surah_entities/revelation_entities.dart';
import 'package:al_quran_app/domain/entities/list_surah_entities/surah_entities.dart';
import 'package:al_quran_app/domain/entities/list_surah_entities/tafsir_id_entities.dart';
import 'package:al_quran_app/domain/entities/list_surah_entities/translation_entities.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

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
    tafsir: TafsirIDEntities(
      id: "Surat Al Faatihah (Pembukaan) yang diturunkan di Mekah dan terdiri dari 7 ayat adalah surat yang pertama-tama diturunkan dengan lengkap  diantara surat-surat yang ada dalam Al Quran dan termasuk golongan surat Makkiyyah. Surat ini disebut Al Faatihah (Pembukaan), karena dengan surat inilah dibuka dan dimulainya Al Quran. Dinamakan Ummul Quran (induk Al Quran) atau Ummul Kitaab (induk Al Kitaab) karena dia merupakan induk dari semua isi Al Quran, dan karena itu diwajibkan membacanya pada tiap-tiap sembahyang. Dinamakan pula As Sab'ul matsaany (tujuh yang berulang-ulang) karena ayatnya tujuh dan dibaca berulang-ulang dalam sholat.",
    ),
  );

  const tSurahModel = SurahModel(
    number: 1,
    sequence: 5,
    numberOfVerses: 7,
    name: NameModel(
      short: "الفاتحة",
      long: "سُورَةُ ٱلْفَاتِحَةِ",
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
      arab: "مكة",
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
      const tId = 1;
      const tDetailSurahModel = DetailSurah(
        number: 114,
        sequence: 21,
        numberOfVerses: 6,
        name: NameModel(
          short: "الناس",
          long: "سورة الناس",
          transliteration: TranslationModel(en: "An-Naas", id: "An-Nas"),
          translation: TranslationModel(en: "Mankind", id: "Manusia"),
        ),
        revelation: RevelationModel(arab: "مكة", en: "Meccan", id: "Makkiyyah"),
        tafsir: TafsirModel(
          id: "Surat ini terdiri atas 6 ayat, termasuk golongan surat-surat Makkiyah, diturunkan sesudah surat Al Falaq. Nama An Naas diambil dari An Naas yang berulang kali disebut dalam surat ini yang artinya manusia.",
        ),
        preBismillah: PreBismillahModel(
          text: TextModel(
            arab: "بِسْمِ اللَّهِ الرَّحْمَٰنِ الرَّحِيمِ",
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
            number: Number(inQuran: 6231, inSurah: 1),
            meta: Meta(
              juz: 30,
              page: 604,
              manzil: 7,
              ruku: 556,
              hizbQuarter: 240,
              sajda: Sajda(recommended: false, obligatory: false),
            ),
            text: TextModel(
              arab: "قُلْ أَعُوذُ بِرَبِّ النَّاسِ",
              transliteration: TranslationModel(
                en: "Qul a'uzu birabbin naas",
              ),
            ),
            translation: TranslationModel(
              en: "Qul a'uzu birabbin naas",
              id: "Katakanlah, “Aku berlindung kepada Tuhannya manusia,",
            ),
            audio: Audio(
              primary:
                  "https://cdn.alquran.cloud/media/audio/ayah/ar.alafasy/6231",
              secondary: [
                "https://cdn.islamic.network/quran/audio/128/ar.alafasy/6231.mp3",
                "https://cdn.islamic.network/quran/audio/64/ar.alafasy/6231.mp3",
              ],
            ),
            tafsir: TafsirID(
              id: Id(
                short:
                    "Wahai Nabi Muhammad, katakanlah kepada umatmu, “Aku berlindung kepada Tuhan yang menciptakan, memelihara, dan mengurus manusia.",
                long:
                    "Dalam ayat ini, Allah memerintahkan Nabi Muhammad termasuk pula di dalamnya seluruh umatnya agar memohon perlindungan kepada Tuhan yang menciptakan, menjaga, menumbuhkan, mengembangkan, dan menjaga kelangsungan hidup manusia dengan nikmat dan kasih sayang-Nya serta memberi peringatan kepada mereka dengan ancaman-ancaman-Nya.",
              ),
            ),
          ),
        ],
      );
      // test(
      //     "should return Surah data when the call to remote data source is successful",
      //     () async {
      //   // arrange
      //   when(mockSurahRemoteDataSource.getDetailSurah(tId)).thenAnswer(
      //     (_) async => tDetailSurahModel,
      //   // act
      //   );
      //   final result = await repository.
      // });
    },
  );
}
