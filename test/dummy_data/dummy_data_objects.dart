import 'package:al_quran_app/domain/entities/list_surah_entities/name_entities.dart';
import 'package:al_quran_app/domain/entities/list_surah_entities/revelation_entities.dart';
import 'package:al_quran_app/domain/entities/list_surah_entities/surah_entities.dart';
import 'package:al_quran_app/domain/entities/list_surah_entities/tafsir_id_entities.dart';
import 'package:al_quran_app/domain/entities/list_surah_entities/translation_entities.dart';

const testQuran = SurahEntities(
  number: 1,
  sequence: 5,
  numberOfVerses: 7,
  name: NameEntities(
    short: "الفاتحة",
    long: "سُورَةُ ٱلْفَاتِحَةِ",
    transliteration: TranslationEntities(
      en: "Al-Faatiha",
      id: "Al-Faatiha",
    ),
    translation: TranslationEntities(
      en: "The Opening",
      id: "Pembukaan",
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

final testQuranList = <SurahEntities>[testQuran];
