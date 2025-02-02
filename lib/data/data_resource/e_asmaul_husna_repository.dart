import 'dart:convert';

import 'package:aplikasi_suara_ilahi/domain/entitas/asmaul_husna_model.dart';
import 'package:flutter/services.dart';

abstract class EasmaulHusnaRepository {
  Future<AsmaulHusnaModel> getData();
}

class AsmaulHusna implements EasmaulHusnaRepository {
  @override
  Future<AsmaulHusnaModel> getData() async {
    final response =
        await rootBundle.loadString('assets/data/asmaul_husna.json');
    final data = json.decode(response);
    return AsmaulHusnaModel.fromJson(data);
  }
}
