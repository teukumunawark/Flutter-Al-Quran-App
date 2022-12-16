import 'package:al_quran_app/domain/entities/surah_detail_entities.dart';

void main() {
  const tDetailSurahEntities = DetailSurahEntities(
    number: 110,
    sequence: 114,
    numberOfVerses: 3,
    name: NameEntities(
      short: "النصر",
      long: "سورة النصر",
      transliteration: TransliterationEntities(
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
    // tafsir: TafsirEntities(
    //     id: "Surat An Nashr terdiri atas 3 ayat, termasuk golongan surat-surat  Madaniyyah yang diturunkan di Mekah sesudah surat At Taubah.  Dinamai An Nashr (pertolongan) diambil dari perkataan Nashr yang  terdapat pada ayat pertama surat ini."),
    preBismillah: PreBismillahEntities(
      text: TextEntities(
        arab: "بِسْمِ اللَّهِ الرَّحْمَٰنِ الرَّحِيمِ",
        transliteration: TransliterationEntities(
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
        number: NumberEntities(
          inQuran: 6214,
          inSurah: 1,
        ),
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
          transliteration: TransliterationEntities(
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
}
