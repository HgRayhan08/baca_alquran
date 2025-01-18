import 'package:aplikasi_suara_ilahi/core/constant.dart';
import 'package:aplikasi_suara_ilahi/domain/entitas/al_quran_model.dart';
import 'package:aplikasi_suara_ilahi/domain/entitas/surat_model.dart';
import 'package:dio/dio.dart';

abstract class EquranDataResourceRepository {
  Future<AlquranModel> surat();
  Future<SuratModel> detailSurat({required int nomor});
}

class EquranDataResource implements EquranDataResourceRepository {
  @override
  Future<AlquranModel> surat() async {
    final response = await Dio().get("$apiAlquran/api/v2/surat");
    return AlquranModel.fromJson(response.data);
  }

  @override
  Future<SuratModel> detailSurat({required int nomor}) async {
    final response = await Dio().get("$apiAlquran/api/v2/surat/$nomor");
    return SuratModel.fromJson(response.data);
  }
}
