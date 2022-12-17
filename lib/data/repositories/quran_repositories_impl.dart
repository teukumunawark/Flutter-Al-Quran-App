import 'dart:io';
import 'package:dartz/dartz.dart';

import '../../common/exception.dart';
import '../../common/failure.dart';
import '../../domain/entities/detail_surah_entities/detail_surah_entities.dart';
import '../../domain/entities/list_surah_entities/surah_entities.dart';
import '../../domain/repositories/quran_repository.dart';
import '../datasources/quran_data_source.dart';

class SurahRepositoryImpl implements SurahRepository {
  final SurahRemoteDataSource remoteDataSource;

  SurahRepositoryImpl({
    required this.remoteDataSource,
  });

  @override
  Future<Either<Failure, List<SurahEntities>>> getListSurah() async {
    try {
      final result = await remoteDataSource.getListSurah();
      return Right(result.map((model) => model.toEntity()).toList());
    } on ServerException {
      return Left(ServerFailure(''));
    } on SocketException {
      return Left(ConnectionFailure('Failed to connect to the network'));
    }
  }

  @override
  Future<Either<Failure, DetailSurahEntities>> getDetailSurah(int id) async {
    try {
      final result = await remoteDataSource.getDetailSurah(id);
      return Right(result.toEntity());
    } on ServerException {
      return Left(ServerFailure(''));
    } on SocketException {
      return Left(ConnectionFailure('Failed to connect to the network'));
    }
  }
}
