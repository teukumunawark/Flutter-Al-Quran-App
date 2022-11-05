import 'dart:convert';

import 'package:al_quran_app/common/exception.dart';
import 'package:al_quran_app/data/models/quran_list_model.dart';
import 'package:al_quran_app/data/models/quran_response.dart';
import 'package:http/http.dart' as http;

abstract class QuranRemoteDataSource {
  Future<List<QuranModel>> getListQuran();
}

class QuranRemoteDataSourceImpl implements QuranRemoteDataSource {
  static const BASE_URL = 'https://api.quran.gading.dev';

  final http.Client client;

  QuranRemoteDataSourceImpl({required this.client});

  @override
  Future<List<QuranModel>> getListQuran() async {
    final response = await client.get(Uri.parse('$BASE_URL/surah'));
    if (response.statusCode == 200) {
      return QuranResponse.fromJson(json.decode(response.body)).quranList;
    } else {
      throw ServerException();
    }
  }
}
