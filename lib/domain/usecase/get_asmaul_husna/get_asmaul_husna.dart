import 'package:aplikasi_suara_ilahi/core/failure.dart';
import 'package:aplikasi_suara_ilahi/domain/entitas/asmaul_husna_model.dart';
import 'package:aplikasi_suara_ilahi/domain/repository/asmaul_husna_repository.dart';
import 'package:dartz/dartz.dart';

class GetAsmaulHusna {
  final AsmaulHusnaRepository asmaulHusnaRepository;

  GetAsmaulHusna(this.asmaulHusnaRepository);

  Future<Either<Failure, AsmaulHusnaModel>> execute() {
    return asmaulHusnaRepository.getData();
  }
}
