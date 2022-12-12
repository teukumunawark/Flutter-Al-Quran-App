import 'dart:convert';
import 'dart:io';
import 'package:al_quran_app/common/exception.dart';
import 'package:al_quran_app/data/datasources/remote_data_source/quran_data_source.dart';
import 'package:al_quran_app/data/models/detail_surah/detail_surah.dart';
import 'package:al_quran_app/data/models/quran_response.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../helpers/test_helper.mocks.dart';
import 'package:http/http.dart' as http;
import '../../json_reader.dart';

void main() {
  const BASE_URL = 'https://api.quran.gading.dev';

  late QuranRemoteDataSourceImpl dataSource;
  late MockHttpClient mockHttpClient;

  setUp(() {
    mockHttpClient = MockHttpClient();
    dataSource = QuranRemoteDataSourceImpl(client: mockHttpClient);
  });

  group("Get List Surah", () {
    final tSurahList = QuranResponse.fromJson(
            json.decode(readJson('dummy_data/list_quran.json')))
        .quranList;

    test('should return list of Surah Model when the response code is 200',
        () async {
      // arrange
      when(mockHttpClient.get(Uri.parse('$BASE_URL/surah'))).thenAnswer(
        (_) async => http.Response(
          readJson('dummy_data/list_quran.json'),
          200,
          headers: {
            HttpHeaders.contentTypeHeader: 'application/json; charset=utf-8',
          },
        ),
      );
      // act
      final result = await dataSource.getListQuran();
      // assert
      expect(result, equals(tSurahList));
    });

    test(
        "should throw a ServerException when the response code is 404 or other",
        () async {
      // arrange
      when(mockHttpClient.get(Uri.parse('$BASE_URL/surah')))
          .thenAnswer((_) async => http.Response("Not Found", 404));
      // act
      final call = dataSource.getListQuran();
      // assert
      expect(() => call, throwsA(isA<ServerException>()));
    });
  });

  group("get detail surah", () {
    const int tId = 110;

    final tDetailSurahModel = DetailSurah.fromJson(
      json.decode(readJson('dummy_data/detail_surah.json')),
    );

    test(
      'should return detail surah when the response code is 200',
      () async {
        // arrange
        when(mockHttpClient.get(Uri.parse('$BASE_URL/surah/$tId'))).thenAnswer(
            (_) async =>
                http.Response(readJson('dummy_data/detail_surah.json'), 200));
        // act
        final result = await dataSource.getDetailSurah(tId);
        // assert
        expect(result, equals(tDetailSurahModel));
      },
    );
  });
}
