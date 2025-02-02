import 'dart:io';

import 'package:aplikasi_suara_ilahi/core/exception.dart';
import 'package:aplikasi_suara_ilahi/core/failure.dart';
import 'package:aplikasi_suara_ilahi/data/data_resource/e_asmaul_husna_repository.dart';
import 'package:aplikasi_suara_ilahi/domain/entitas/asmaul_husna_model.dart';
import 'package:aplikasi_suara_ilahi/domain/repository/asmaul_husna_repository.dart';
import 'package:dartz/dartz.dart';

class DataAsmaulHusnaRepository extends AsmaulHusnaRepository {
  final EasmaulHusnaRepository asmaulHusna;

  DataAsmaulHusnaRepository({required this.asmaulHusna});
  @override
  Future<Either<Failure, AsmaulHusnaModel>> getData() async {
    try {
      final result = await asmaulHusna.getData();
      return Right(result);
    } on ServerException {
      return Left(ServerFailure("Terjdi Error di sisi Server"));
    } on SocketException {
      return Left(ConnectionFailure("Terjdi Error di sisi Server"));
    }
  }
}
