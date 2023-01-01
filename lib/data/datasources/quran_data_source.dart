import 'dart:convert';

import 'package:al_quran_app/common/exception.dart';
import 'package:al_quran_app/data/models/juz_response.dart';
import 'package:al_quran_app/data/models/list_juz_models/juz_model.dart';
import 'package:al_quran_app/data/models/surah_response.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;

import '../models/detail_surah/detail_surah_model.dart';
import '../models/list_surah_models/surah_model.dart';

abstract class SurahRemoteDataSource {
  Future<List<SurahModel>> readListSurah();
  Future<List<JuzModel>> readListJuz();
  Future<DetailSurah> getDetailSurah(int id);
}

class SurahRemoteDataSourceImpl implements SurahRemoteDataSource {
  static const baseURL = 'https://api.quran.gading.dev';
  final http.Client client;
  SurahRemoteDataSourceImpl({required this.client});

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

  @override
  Future<DetailSurah> getDetailSurah(int id) async {
    final response = await client.get(Uri.parse('$baseURL/surah/$id'));
    if (response.statusCode == 200) {
      return DetailSurah.fromJson(json.decode(response.body)['data']);
    } else {
      throw ServerException();
    }
  }

  @override
  Future<List<SurahModel>> readListSurah() async {
    final response = await rootBundle.loadString('assets/data/surah.json');
    return SurahResponse.fromJson(json.decode(response)).surahList;
  }

  @override
  Future<List<JuzModel>> readListJuz() async {
    final response = await rootBundle.loadString('assets/data/juz.json');
    print(response);
    return JuzResponse.fromJson(json.decode(response)).listJuz;
  }
}
