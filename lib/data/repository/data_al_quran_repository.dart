import 'dart:io';

import 'package:aplikasi_suara_ilahi/core/exception.dart';
import 'package:aplikasi_suara_ilahi/core/failure.dart';
import 'package:aplikasi_suara_ilahi/data/data_resource/e_quran_repository.dart';
import 'package:aplikasi_suara_ilahi/domain/entitas/al_quran_model.dart';
import 'package:aplikasi_suara_ilahi/domain/repository/al_quran_repository.dart';
import 'package:dartz/dartz.dart';

class DataAlQuranRepository extends AlQuranRepository {
  final EquranDataResource equranDataResource;

  DataAlQuranRepository({required this.equranDataResource});

  @override
  Future<Either<Failure, AlquranModel>> getSurat() async {
    try {
      final result = await equranDataResource.surat();
      return Right(result);
    } on ServerException {
      return Left(ServerFailure("Terjadi error di sisi Server"));
    } on SocketException {
      return Left(ConnectionFailure("Terjadi error ddi sisi Connection"));
    }
  }
}
