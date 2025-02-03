import 'package:aplikasi_suara_ilahi/core/failure.dart';
import 'package:aplikasi_suara_ilahi/domain/entitas/doa_model.dart';
import 'package:aplikasi_suara_ilahi/domain/repository/doa_repository.dart';
import 'package:dartz/dartz.dart';

class GetDoa {
  final DoaRepository doaRepository;

  GetDoa(this.doaRepository);

  Future<Either<Failure, DoaModel>> execute() {
    return doaRepository.getDoa();
  }
}
