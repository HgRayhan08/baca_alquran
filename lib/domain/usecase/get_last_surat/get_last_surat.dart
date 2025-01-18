import 'package:aplikasi_suara_ilahi/core/failure.dart';
import 'package:aplikasi_suara_ilahi/domain/repository/local_surat_repository.dart';
import 'package:dartz/dartz.dart';

class GetLastSurat {
  final LocalSuratRepository localSuratRepository;

  GetLastSurat(this.localSuratRepository);

  Future<Either<Failure, Map<String, dynamic>>> excecute() {
    return localSuratRepository.getLastSurat();
  }
}
