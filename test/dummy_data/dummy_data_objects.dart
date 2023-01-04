import 'package:al_quran_app/domain/entities/surah_entities/detail_surah_entities/audio_entities.dart';
import 'package:al_quran_app/domain/entities/surah_entities/detail_surah_entities/detail_surah_entities.dart';
import 'package:al_quran_app/domain/entities/surah_entities/detail_surah_entities/id_entities.dart';
import 'package:al_quran_app/domain/entities/surah_entities/detail_surah_entities/meta_entities.dart';
import 'package:al_quran_app/domain/entities/surah_entities/detail_surah_entities/number_entities.dart';
import 'package:al_quran_app/domain/entities/surah_entities/detail_surah_entities/pre_bismillah_entities.dart';
import 'package:al_quran_app/domain/entities/surah_entities/detail_surah_entities/sajda_entities.dart';
import 'package:al_quran_app/domain/entities/surah_entities/detail_surah_entities/tafsir_entities.dart';
import 'package:al_quran_app/domain/entities/surah_entities/detail_surah_entities/text_entities.dart';
import 'package:al_quran_app/domain/entities/surah_entities/detail_surah_entities/verse_entities.dart';
import 'package:al_quran_app/domain/entities/surah_entities/list_surah_entities/name_entities.dart';
import 'package:al_quran_app/domain/entities/surah_entities/list_surah_entities/revelation_entities.dart';
import 'package:al_quran_app/domain/entities/surah_entities/list_surah_entities/surah_entities.dart';
import 'package:al_quran_app/domain/entities/surah_entities/list_surah_entities/tafsir_id_entities.dart';
import 'package:al_quran_app/domain/entities/surah_entities/list_surah_entities/translation_entities.dart';

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
  tafsir: TafsirEntities(
    id: "Surat Al Faatihah (Pembukaan) yang diturunkan di Mekah dan terdiri dari 7 ayat adalah surat yang pertama-tama diturunkan dengan lengkap  diantara surat-surat yang ada dalam Al Quran dan termasuk golongan surat Makkiyyah. Surat ini disebut Al Faatihah (Pembukaan), karena dengan surat inilah dibuka dan dimulainya Al Quran. Dinamakan Ummul Quran (induk Al Quran) atau Ummul Kitaab (induk Al Kitaab) karena dia merupakan induk dari semua isi Al Quran, dan karena itu diwajibkan membacanya pada tiap-tiap sembahyang. Dinamakan pula As Sab'ul matsaany (tujuh yang berulang-ulang) karena ayatnya tujuh dan dibaca berulang-ulang dalam sholat.",
  ),
);

final testQuranList = <SurahEntities>[testQuran];

const tDetailSurahEntities = DetailSurahEntities(
  number: 110,
  sequence: 114,
  numberOfVerses: 3,
  name: NameEntities(
    short: "النصر",
    long: "سورة النصر",
    transliteration: TranslationEntities(
      en: "An-Nasr",
      id: "An-Nasr",
    ),
    translation: TranslationEntities(
      en: "Divine Support",
      id: "Pertolongan",
    ),
  ),
  revelation: RevelationEntities(
    arab: "مدينة",
    en: "Medinan",
    id: "Madaniyyah",
  ),
  tafsir: TafsirEntities(
    id: "Surat An Nashr terdiri atas 3 ayat, termasuk golongan surat-surat  Madaniyyah yang diturunkan di Mekah sesudah surat At Taubah.  Dinamai An Nashr (pertolongan) diambil dari perkataan Nashr yang  terdapat pada ayat pertama surat ini.",
  ),
  preBismillah: PreBismillahEntities(
    text: TextEntities(
      arab: "بِسْمِ اللَّهِ الرَّحْمَٰنِ الرَّحِيمِ",
      transliteration: TranslationEntities(
        en: "Bismillaahir Rahmaanir Raheem",
      ),
    ),
    translation: TranslationEntities(
      en: "In the name of Allah, the Entirely Merciful, the Especially Merciful.",
      id: "Dengan nama Allah Yang Maha Pengasih, Maha Penyayang.",
    ),
    audio: AudioEntities(
      primary: "https://cdn.alquran.cloud/media/audio/ayah/ar.alafasy/1",
      secondary: [
        "https://cdn.islamic.network/quran/audio/128/ar.alafasy/1.mp3",
        "https://cdn.islamic.network/quran/audio/64/ar.alafasy/1.mp3",
      ],
    ),
  ),
  verses: [
    VerseEntities(
      number: NumberEntities(inQuran: 6214, inSurah: 1),
      meta: MetaEntities(
        juz: 30,
        page: 603,
        manzil: 7,
        ruku: 552,
        hizbQuarter: 240,
        sajda: SajdaEntities(
          recommended: false,
          obligatory: false,
        ),
      ),
      text: TextEntities(
        arab: "إِذَا جَاءَ نَصْرُ اللَّهِ وَالْفَتْحُ",
        transliteration: TranslationEntities(
          en: "Iza jaa-a nas rullahi walfath",
        ),
      ),
      translation: TranslationEntities(
        en: "When the victory of Allah has come and the conquest,",
        id: "Apabila telah datang pertolongan Allah dan kemenangan,",
      ),
      audio: AudioEntities(
        primary: "https://cdn.alquran.cloud/media/audio/ayah/ar.alafasy/1",
        secondary: [
          "https://cdn.islamic.network/quran/audio/128/ar.alafasy/1.mp3",
          "https://cdn.islamic.network/quran/audio/64/ar.alafasy/1.mp3",
        ],
      ),
      tafsir: TafsirIDEntities(
        id: IdEntities(
          short:
              "Wahai Nabi Muhammad, apabila telah datang pertolongan Allah kepadamu dan pengikutmu dalam menghadapi kaum kafir Quraisy, dan telah datang pula kemenangan kepadamu dengan penaklukan Mekah menjadi kota yang suci kembali dari kesyirikan dan kekafiran,",
          long:
              "Dalam ayat-ayat ini, Allah memerintahkan apa yang harus dilakukan Nabi Muhammad pada saat pembebasan Mekah, yaitu apabila ia telah melihat pertolongan Allah terhadap agama-Nya telah tiba, dengan kekalahan orang-orang musyrik dan kemenangan di pihak Nabi, dan melihat pula orang-orang masuk agama Allah beramai-ramai dan berduyun-duyun, bukan perseorangan sebagaimana halnya pada permulaan dakwah.\n\nOrang-orang Arab berkata, \"Manakala Muhammad menang atas penduduk Mekah yang mana Allah telah selamatkan mereka dari pasukan bergajah, maka kalian tidak berdaya melawannya.\" Akhirnya mereka masuk Islam berduyun-duyun, berkelompok-kelompok dan satu kelompok 40 orang.",
        ),
      ),
    ),
  ],
);

// const tDetailSurahModel = DetailSurah(
//   number: 110,
//   sequence: 114,
//   numberOfVerses: 3,
//   name: NameModel(
//     short: "النصر",
//     long: "سورة النصر",
//     transliteration: TranslationModel(
//       en: "An-Nasr",
//       id: "An-Nasr",
//     ),
//     translation: TranslationModel(
//       en: "Divine Support",
//       id: "Pertolongan",
//     ),
//   ),
//   revelation: RevelationModel(
//     arab: "مدينة",
//     en: "Medinan",
//     id: "Madaniyyah",
//   ),
//   tafsir: TafsirModel(
//     id: "Surat An Nashr terdiri atas 3 ayat, termasuk golongan surat-surat  Madaniyyah yang diturunkan di Mekah sesudah surat At Taubah.  Dinamai An Nashr (pertolongan) diambil dari perkataan Nashr yang  terdapat pada ayat pertama surat ini.",
//   ),
//   preBismillah: PreBismillahModel(
//     text: TextModel(
//       arab: "بِسْمِ اللَّهِ الرَّحْمَٰنِ الرَّحِيمِ",
//       transliteration: TranslationModel(
//         en: "Bismillaahir Rahmaanir Raheem",
//       ),
//     ),
//     translation: TranslationModel(
//       en: "In the name of Allah, the Entirely Merciful, the Especially Merciful.",
//       id: "Dengan nama Allah Yang Maha Pengasih, Maha Penyayang.",
//     ),
//     audio: Audio(
//       primary: "https://cdn.alquran.cloud/media/audio/ayah/ar.alafasy/1",
//       secondary: [
//         "https://cdn.islamic.network/quran/audio/128/ar.alafasy/1.mp3",
//         "https://cdn.islamic.network/quran/audio/64/ar.alafasy/1.mp3",
//       ],
//     ),
//   ),
//   verses: [
//     VerseModel(
//       number: Number(inQuran: 6214, inSurah: 1),
//       meta: Meta(
//         juz: 30,
//         page: 603,
//         manzil: 7,
//         ruku: 552,
//         hizbQuarter: 240,
//         sajda: Sajda(recommended: false, obligatory: false),
//       ),
//       text: TextModel(
//         arab: "إِذَا جَاءَ نَصْرُ اللَّهِ وَالْفَتْحُ",
//         transliteration: TranslationModel(
//           en: "Iza jaa-a nas rullahi walfath",
//         ),
//       ),
//       translation: TranslationModel(
//         en: "When the victory of Allah has come and the conquest,",
//         id: "Apabila telah datang pertolongan Allah dan kemenangan,",
//       ),
//       audio: Audio(
//         primary: "https://cdn.alquran.cloud/media/audio/ayah/ar.alafasy/1",
//         secondary: [
//           "https://cdn.islamic.network/quran/audio/128/ar.alafasy/1.mp3",
//           "https://cdn.islamic.network/quran/audio/64/ar.alafasy/1.mp3",
//         ],
//       ),
//       tafsir: TafsirID(
//         id: Id(
//           short:
//               "Wahai Nabi Muhammad, apabila telah datang pertolongan Allah kepadamu dan pengikutmu dalam menghadapi kaum kafir Quraisy, dan telah datang pula kemenangan kepadamu dengan penaklukan Mekah menjadi kota yang suci kembali dari kesyirikan dan kekafiran,",
//           long:
//               "Dalam ayat-ayat ini, Allah memerintahkan apa yang harus dilakukan Nabi Muhammad pada saat pembebasan Mekah, yaitu apabila ia telah melihat pertolongan Allah terhadap agama-Nya telah tiba, dengan kekalahan orang-orang musyrik dan kemenangan di pihak Nabi, dan melihat pula orang-orang masuk agama Allah beramai-ramai dan berduyun-duyun, bukan perseorangan sebagaimana halnya pada permulaan dakwah.\n\nOrang-orang Arab berkata, \"Manakala Muhammad menang atas penduduk Mekah yang mana Allah telah selamatkan mereka dari pasukan bergajah, maka kalian tidak berdaya melawannya.\" Akhirnya mereka masuk Islam berduyun-duyun, berkelompok-kelompok dan satu kelompok 40 orang.",
//         ),
//       ),
//     ),
//   ],
// );
