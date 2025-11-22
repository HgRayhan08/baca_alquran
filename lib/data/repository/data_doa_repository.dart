import 'dart:io';

import 'package:aplikasi_suara_ilahi/core/exception.dart';
import 'package:aplikasi_suara_ilahi/core/failure.dart';
import 'package:aplikasi_suara_ilahi/data/data_resource/e_doa_repository.dart';
import 'package:aplikasi_suara_ilahi/domain/entitas/doa_model.dart';
import 'package:aplikasi_suara_ilahi/domain/repository/doa_repository.dart';
import 'package:dartz/dartz.dart';

class DataDoaRepository extends DoaRepository {
  final EDoaRepository doaRepository;

  DataDoaRepository({required this.doaRepository});
  @override
  Future<Either<Failure, DoaModel>> getDoa() async {
    try {
      final result = await doaRepository.getData();
      return Right(result);
    } on ServerException {
      return Left(ServerFailure("Terjadi Error di Sisi Server"));
    } on SocketException {
      return Left(ServerFailure("Terjadi Error di jaringan"));
    }
  }
}
