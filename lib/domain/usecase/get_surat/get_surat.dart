import 'package:aplikasi_suara_ilahi/core/failure.dart';
import 'package:aplikasi_suara_ilahi/domain/entitas/al_quran_model.dart';
import 'package:aplikasi_suara_ilahi/domain/repository/al_quran_repository.dart';
import 'package:dartz/dartz.dart';

class GetSurat {
  final AlQuranRepository alQuranRepository;

  GetSurat(this.alQuranRepository);

  Future<Either<Failure, AlquranModel>> execute() {
    return alQuranRepository.getSurat();
  }
}
