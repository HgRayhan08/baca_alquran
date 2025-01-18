import 'package:aplikasi_suara_ilahi/core/failure.dart';
import 'package:aplikasi_suara_ilahi/domain/entitas/surat_model.dart';
import 'package:dartz/dartz.dart';

abstract class LocalSuratRepository {
  Future<Either<Failure, Map<String, dynamic>>> getLastSurat();
  Future<Either<Failure, String>> removeLastSurat(SuratModel surat);
  Future<Either<Failure, String>> insertLastSurat(SuratModel surat);
}
