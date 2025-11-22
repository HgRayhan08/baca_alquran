import 'package:aplikasi_suara_ilahi/core/failure.dart';
import 'package:aplikasi_suara_ilahi/domain/entitas/doa_model.dart';
import 'package:dartz/dartz.dart';

abstract class DoaRepository {
  Future<Either<Failure, DoaModel>> getDoa();
}
