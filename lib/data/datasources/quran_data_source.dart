import 'dart:convert';

import 'package:al_quran_app/common/exception.dart';
import 'package:al_quran_app/data/models/jadwal_shalat_response.dart';
import 'package:al_quran_app/data/models/jadwal_sholat_model/jadwal_sholat_model.dart';
import 'package:al_quran_app/data/models/juz_response.dart';
import 'package:al_quran_app/data/models/surah_response.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart';

import '../models/surah_model/detail_surah_model/detail_surah_model.dart';
import '../models/juz_model/detail_juz_model.dart';
import '../models/juz_model/juz_model.dart';
import '../models/surah_model/list_surah_models/surah_model.dart';

abstract class SurahRemoteDataSource {
  Future<List<SurahModel>> readListSurah();
  Future<List<JuzModel>> readListJuz();
  Future<DetailSurah> readDetailSurah(String id);
  Future<DetailJuz> readDetailJuz(String id);
  Future<List<JadwalModel>> getJadwalShalat(String month);
}

class SurahRemoteDataSourceImpl implements SurahRemoteDataSource {
  SurahRemoteDataSourceImpl({required this.client});

  final Client client;

  static const baseURL = "https://api.myquran.com/v1/sholat/jadwal/0103/2023";

  // if you want to hit endpoint for get list surah you can use this function
  // ========================================================================
  // @override
  // Future<List<SurahModel>> getListSurah() async {
  //   final response = await client.get(Uri.parse('$baseURL/surah'));
  //   if (response.statusCode == 200) {
  //     return SurahResponse.fromJson(json.decode(response.body)).quranList;
  //   } else {
  //     throw ServerException();
  //   }
  // }

  // @override
  // Future<DetailSurah> getDetailSurah(int id) async {
  //   final response = await client.get(Uri.parse('$baseURL/surah/$id'));
  //   if (response.statusCode == 200) {
  //     return DetailSurah.fromJson(json.decode(response.body)['data']);
  //   } else {
  //     throw ServerException();
  //   }
  // }

  @override
  Future<List<SurahModel>> readListSurah() async {
    try {
      final response = await rootBundle.loadString('assets/data/surah.json');
      return SurahResponse.fromJson(json.decode(response)).surahList;
    } catch (e) {
      throw ServerException();
    }
  }

  @override
  Future<List<JuzModel>> readListJuz() async {
    try {
      final response = await rootBundle.loadString('assets/data/juz.json');
      return JuzResponse.fromJson(json.decode(response)).listJuz;
    } catch (e) {
      throw ServerException();
    }
  }

  @override
  Future<DetailJuz> readDetailJuz(String id) async {
    try {
      final response = await rootBundle.loadString(
        'assets/data/detail-juz/$id.json',
      );
      return DetailJuz.fromJson(json.decode(response)['data']);
    } catch (e) {
      throw ServerException();
    }
  }

  @override
  Future<DetailSurah> readDetailSurah(String id) async {
    try {
      final response = await rootBundle.loadString(
        'assets/data/detail-surah/$id.json',
      );
      return DetailSurah.fromJson(json.decode(response)['data']);
    } catch (e) {
      throw ServerException();
    }
  }

  @override
  Future<List<JadwalModel>> getJadwalShalat(String month) async {
    final response = await client.get(Uri.parse("$baseURL/$month"));
    if (response.statusCode == 200) {
      return JadwalResponse.fromJson(json.decode(response.body)).jadwal;
    } else {
      throw ServerException();
    }
  }
}
