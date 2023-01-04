import 'dart:io';

import 'package:al_quran_app/domain/entities/jadwal_entities/jadwal_shalat_entities.dart';
import 'package:dartz/dartz.dart';
import '../../common/failure.dart';
import '../../common/exception.dart';
import '../../domain/entities/juz_entities/detail_juz_entities.dart';
import '../datasources/quran_data_source.dart';
import '../../domain/repositories/quran_repository.dart';
import '../../domain/entities/juz_entities/juz_entities.dart';
import '../../domain/entities/surah_entities/list_surah_entities/surah_entities.dart';
import '../../domain/entities/surah_entities/detail_surah_entities/detail_surah_entities.dart';

class SurahRepositoryImpl implements QuranRepository {
  final SurahRemoteDataSource remoteDataSource;

  SurahRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Either<Failure, List<SurahEntities>>> getListSurah() async {
    try {
      final result = await remoteDataSource.readListSurah();
      return Right(result.map((model) => model.toEntity()).toList());
    } on ServerException {
      return Left(ServerFailure(''));
    }
  }

  @override
  Future<Either<Failure, List<JuzEntities>>> getListJuz() async {
    try {
      final result = await remoteDataSource.readListJuz();
      return Right(result.map((model) => model.toEntity()).toList());
    } on ServerException {
      return Left(ServerFailure(''));
    }
  }

  @override
  Future<Either<Failure, DetailJuzEntities>> getDetailJuz(String id) async {
    try {
      final result = await remoteDataSource.readDetailJuz(id);
      return Right(result.toEntity());
    } on ServerException {
      return Left(ServerFailure(''));
    }
  }

  @override
  Future<Either<Failure, DetailSurahEntities>> getDetailSurah(String id) async {
    try {
      final result = await remoteDataSource.readDetailSurah(id);
      return Right(result.toEntity());
    } on ServerException {
      return Left(ServerFailure(''));
    }
  }

  @override
  Future<Either<Failure, List<JadwalEntities>>> getJadwalShalat(
      String month) async {
    try {
      final result = await remoteDataSource.getJadwalShalat(month);
      return Right(result.map((model) => model.toEntity()).toList());
    } on ServerException {
      return Left(ServerFailure(''));
    } on SocketException {
      return Left(ConnectionFailure('Failed to connect to the network'));
    }
  }
}
