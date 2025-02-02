import 'package:aplikasi_suara_ilahi/core/failure.dart';
import 'package:aplikasi_suara_ilahi/domain/entitas/asmaul_husna_model.dart';
import 'package:dartz/dartz.dart';

abstract class AsmaulHusnaRepository {
  Future<Either<Failure, AsmaulHusnaModel>> getData();
}
