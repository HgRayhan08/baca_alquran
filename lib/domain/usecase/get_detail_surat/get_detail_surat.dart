import 'package:aplikasi_suara_ilahi/core/failure.dart';
import 'package:aplikasi_suara_ilahi/domain/entitas/surat_model.dart';
import 'package:aplikasi_suara_ilahi/domain/repository/detail_surat_repository.dart';
import 'package:dartz/dartz.dart';

class GetDetailSurat {
  final DetailSuratRepository detailSuratRepository;

  GetDetailSurat(this.detailSuratRepository);

  Future<Either<Failure, SuratModel>> execute(int nomor) {
    return detailSuratRepository.getDetailSurat(nomor);
  }
}
