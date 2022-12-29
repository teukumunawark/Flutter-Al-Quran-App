import 'dart:convert';

import 'package:al_quran_app/common/exception.dart';
import 'package:al_quran_app/data/models/quran_response.dart';
import 'package:http/http.dart' as http;

import '../models/detail_surah/detail_surah_model.dart';
import '../models/list_surah_models/surah_model.dart';

abstract class SurahRemoteDataSource {
  Future<List<SurahModel>> getListSurah();
  Future<DetailSurah> getDetailSurah(int id);
}

class SurahRemoteDataSourceImpl implements SurahRemoteDataSource {
  static const baseURL = 'https://api.quran.gading.dev';
  final http.Client client;
  SurahRemoteDataSourceImpl({required this.client});

  @override
  Future<List<SurahModel>> getListSurah() async {
    final response = await client.get(Uri.parse('$baseURL/surah'));
    print(response.body);
    if (response.statusCode == 200) {
      return QuranResponse.fromJson(json.decode(response.body)).quranList;
    } else {
      throw ServerException();
    }
  }

  @override
  Future<DetailSurah> getDetailSurah(int id) async {
    final response = await client.get(Uri.parse('$baseURL/surah/$id'));
    if (response.statusCode == 200) {
      return DetailSurah.fromJson(json.decode(response.body)['data']);
    } else {
      throw ServerException();
    }
  }
}
