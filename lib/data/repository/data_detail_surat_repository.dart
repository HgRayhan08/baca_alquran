import 'dart:io';

import 'package:aplikasi_suara_ilahi/core/exception.dart';
import 'package:aplikasi_suara_ilahi/core/failure.dart';
import 'package:aplikasi_suara_ilahi/data/data_resource/e_quran_repository.dart';
import 'package:aplikasi_suara_ilahi/domain/entitas/surat_model.dart';
import 'package:aplikasi_suara_ilahi/domain/repository/detail_surat_repository.dart';
import 'package:dartz/dartz.dart';

class DataDetailSuratRepository extends DetailSuratRepository {
  final EquranDataResource equranDataResource;

  DataDetailSuratRepository({required this.equranDataResource});
  @override
  Future<Either<Failure, SuratModel>> getDetailSurat(int nomor) async {
    try {
      final result = await equranDataResource.detailSurat(nomor: nomor);
      return Right(result);
    } on ServerException {
      return Left(ServerFailure("Terjaddi error disisi Server"));
    } on SocketException {
      return Left(ConnectionFailure("Terjadi error di sisi connection"));
    }
  }
}
