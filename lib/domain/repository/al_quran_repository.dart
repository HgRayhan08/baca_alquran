import 'package:aplikasi_suara_ilahi/core/failure.dart';
import 'package:aplikasi_suara_ilahi/domain/entitas/al_quran_model.dart';
import 'package:dartz/dartz.dart';

abstract class AlQuranRepository {
  Future<Either<Failure, AlquranModel>> getSurat();
}
