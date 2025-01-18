import 'package:aplikasi_suara_ilahi/core/failure.dart';
import 'package:aplikasi_suara_ilahi/domain/entitas/surat_model.dart';
import 'package:aplikasi_suara_ilahi/domain/repository/local_surat_repository.dart';
import 'package:dartz/dartz.dart';

class InsertlastSurat {
  final LocalSuratRepository localSuratRepository;

  InsertlastSurat(this.localSuratRepository);

  Future<Either<Failure, String>> excecute(SuratModel surat) {
    return localSuratRepository.insertLastSurat(surat);
  }
}
