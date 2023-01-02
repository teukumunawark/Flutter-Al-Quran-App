import 'dart:convert';
import 'dart:io';
import 'package:al_quran_app/common/exception.dart';
import 'package:al_quran_app/data/datasources/quran_data_source.dart';
import 'package:al_quran_app/data/models/detail_surah_model/detail_surah_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../helpers/test_helper.mocks.dart';
import 'package:http/http.dart' as http;
import '../../json_reader.dart';

void main() {
  const baseURL = 'https://api.quran.gading.dev';
  late SurahRemoteDataSourceImpl dataSource;
  late MockHttpClient mockHttpClient;
  setUp(() {
    mockHttpClient = MockHttpClient();
    dataSource = SurahRemoteDataSourceImpl(client: mockHttpClient);
  });

  // group("Get List Surah", () {
  //   final tSurahList = SurahResponse.fromJson(
  //           json.decode(readJson('dummy_data/list_quran.json')))
  //       .quranList;

  //   test('should return list of Surah Model when the response code is 200',
  //       () async {
  //     // arrange
  //     when(mockHttpClient.get(Uri.parse('$baseURL/surah'))).thenAnswer(
  //       (_) async => http.Response(readJson('dummy_data/list_quran.json'), 200,
  //           headers: {
  //             HttpHeaders.contentTypeHeader: 'application/json; charset=utf-8',
  //           }),
  //     );
  //     // act
  //     final result = await dataSource.readListSurah();
  //     // assert
  //     expect(result, equals(tSurahList));
  //   });

  //   test(
  //       "should throw a ServerException when the response code is 404 or other",
  //       () async {
  //     // arrange
  //     when(mockHttpClient.get(Uri.parse('$baseURL/surah')))
  //         .thenAnswer((_) async => http.Response("Not Found", 404));
  //     // act
  //     final call = dataSource.readListJuz();
  //     // assert
  //     expect(() => call, throwsA(isA<ServerException>()));
  //   });
  // });

  group("get detail surah", () {
    const int tId = 110;

    final tDetailSurahModel = DetailSurah.fromJson(
      json.decode(readJson('dummy_data/detail_surah.json')),
    );

    test(
      'should return detail surah when the response code is 200',
      () async {
        // arrange
        when(mockHttpClient.get(Uri.parse('$baseURL/surah/$tId'))).thenAnswer(
          (_) async => http.Response(
              readJson('dummy_data/detail_surah.json'), 200, headers: {
            HttpHeaders.contentTypeHeader: "application/json; charset=utf-8"
          }),
        );
        // act
        final result = await dataSource.getDetailSurah(tId);
        // assert
        expect(result, equals(tDetailSurahModel));
      },
    );

    test('should throw Server Exception when the response code is 404 or other',
        () async {
      // arrange
      when(mockHttpClient.get(Uri.parse('$baseURL/surah/$tId'))).thenAnswer(
          (_) async => http.Response(
                  readJson('dummy_data/detail_surah.json'), 404, headers: {
                HttpHeaders.contentTypeHeader: "application/json; charset=utf-8"
              }));
      // act
      final call = dataSource.getDetailSurah(tId);
      // assert
      expect(() => call, throwsA(isA<ServerException>()));
    });
  });
}
