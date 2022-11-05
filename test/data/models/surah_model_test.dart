import 'package:al_quran_app/data/models/quran_list_model.dart';
import 'package:al_quran_app/domain/entities/quran_entities.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
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

  test("should be a subclass of surah Entity", () async {
    final result = tSurahModel.toEntity();
    expect(result, tSurahEntities);
  });
}
