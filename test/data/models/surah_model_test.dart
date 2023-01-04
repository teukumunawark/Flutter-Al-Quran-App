import 'package:al_quran_app/data/models/surah_model/list_surah_models/name_model.dart';
import 'package:al_quran_app/data/models/surah_model/list_surah_models/revalation_model.dart';
import 'package:al_quran_app/data/models/surah_model/list_surah_models/surah_model.dart';
import 'package:al_quran_app/data/models/surah_model/list_surah_models/tafsir_model.dart';
import 'package:al_quran_app/data/models/surah_model/list_surah_models/translation_model.dart';
import 'package:al_quran_app/domain/entities/surah_entities/list_surah_entities/name_entities.dart';
import 'package:al_quran_app/domain/entities/surah_entities/list_surah_entities/revelation_entities.dart';
import 'package:al_quran_app/domain/entities/surah_entities/list_surah_entities/surah_entities.dart';
import 'package:al_quran_app/domain/entities/surah_entities/list_surah_entities/tafsir_id_entities.dart';
import 'package:al_quran_app/domain/entities/surah_entities/list_surah_entities/translation_entities.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
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
    tafsir: TafsirEntities(
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

  test("should be a subclass of surah Entity", () async {
    final result = tSurahModel.toEntity();
    expect(result, tSurahEntities);
  });
}
