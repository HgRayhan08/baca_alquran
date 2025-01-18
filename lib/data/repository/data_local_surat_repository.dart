import 'dart:io';

import 'package:aplikasi_suara_ilahi/core/exception.dart';
import 'package:aplikasi_suara_ilahi/core/failure.dart';
import 'package:aplikasi_suara_ilahi/data/data_resource/sqlite_repository.dart';
import 'package:aplikasi_suara_ilahi/domain/entitas/surat_model.dart';
import 'package:aplikasi_suara_ilahi/domain/repository/local_surat_repository.dart';
import 'package:dartz/dartz.dart';

class DataLocalSuratRepository extends LocalSuratRepository {
  final SqliteRepository sqliteRepository;

  DataLocalSuratRepository({required this.sqliteRepository});

  @override
  Future<Either<Failure, Map<String, dynamic>>> getLastSurat() async {
    try {
      final result = await sqliteRepository.getLastSurat();
      if (result == {}) {
        return Right({});
      } else {
        return Right(result);
      }
    } on ServerException {
      return Left(ServerFailure("Terjadi kesalahan Disisi Server"));
    } on SocketException {
      return Left(ConnectionFailure("Terjadi kesalahan disisi Connection"));
    }
  }

  @override
  Future<Either<Failure, String>> insertLastSurat(SuratModel surat) async {
    try {
      await sqliteRepository.insertLastSurat(surat);

      return Right("Sucsess Insert");
    } on ServerException {
      return Left(ServerFailure("Terjadi kesalahan Disisi Server"));
    } on SocketException {
      return Left(ConnectionFailure("Terjadi kesalahan disisi Connection"));
    }
  }

  @override
  Future<Either<Failure, String>> removeLastSurat(SuratModel surat) async {
    try {
      await sqliteRepository.removeLastSurat(surat);
      return Right("Sucsess remove");
    } on ServerException {
      return Left(ServerFailure("Terjadi kesalahan Disisi Server"));
    } on SocketException {
      return Left(ConnectionFailure("Terjadi kesalahan disisi Connection"));
    }
  }
}
