import 'dart:convert';

import 'package:aplikasi_suara_ilahi/domain/entitas/doa_model.dart';
import 'package:flutter/services.dart';

abstract class EDoaRepository {
  Future<DoaModel> getData();
}

class DoaDataResource implements EDoaRepository {
  @override
  Future<DoaModel> getData() async {
    final response = await rootBundle.loadString("assets/data/doa.json");
    final data = json.decode(response);
    return DoaModel.fromJson(data);
  }
}
