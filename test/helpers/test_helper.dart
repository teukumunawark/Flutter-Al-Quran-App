import 'package:al_quran_app/data/datasources/remote_data_source/quran_data_source.dart';
import 'package:al_quran_app/domain/repositories/quran_repository.dart';
import 'package:mockito/annotations.dart';
import 'package:http/http.dart' as http;

@GenerateMocks([
  SurahRepository,
  SurahRemoteDataSource,
], customMocks: [
  MockSpec<http.Client>(as: #MockHttpClient)
])
void main() {}
