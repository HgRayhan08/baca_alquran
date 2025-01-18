import 'package:aplikasi_suara_ilahi/core/failure.dart';
import 'package:aplikasi_suara_ilahi/domain/entitas/surat_model.dart';
import 'package:dartz/dartz.dart';

abstract class DetailSuratRepository {
  Future<Either<Failure, SuratModel>> getDetailSurat(int nomor);
}
