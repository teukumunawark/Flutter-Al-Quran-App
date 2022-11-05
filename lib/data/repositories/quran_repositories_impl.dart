import 'dart:io';

import 'package:al_quran_app/common/exception.dart';
import 'package:al_quran_app/data/datasources/remote_data_source/quran_data_source.dart';
import 'package:dartz/dartz.dart';

import 'package:al_quran_app/domain/entities/quran_entities.dart';

import 'package:al_quran_app/common/failure.dart';

import '../../domain/repositories/quran_repository.dart';

class QuranRepositoryImpl implements QuranRepository {
  final QuranRemoteDataSource remoteDataSource;

  QuranRepositoryImpl({
    required this.remoteDataSource,
  });

  @override
  Future<Either<Failure, List<QuranEntities>>> getListQuran() async {
    try {
      final result = await remoteDataSource.getListQuran();
      return Right(result.map((model) => model.toEntity()).toList());
    } on ServerException {
      return Left(ServerFailure(''));
    } on SocketException {
      return Left(ConnectionFailure('Failed to connect to the network'));
    }
  }
}
