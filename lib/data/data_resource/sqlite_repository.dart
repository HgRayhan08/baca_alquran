import 'package:aplikasi_suara_ilahi/data/db/database_helper.dart';
import 'package:aplikasi_suara_ilahi/domain/entitas/surat_model.dart';

abstract class AbstractSqlite {
  Future<String> insertLastSurat(SuratModel surat);
  Future<String> removeLastSurat(SuratModel surat);
  Future<Map<String, dynamic>> getLastSurat();
}

class SqliteRepository implements AbstractSqlite {
  final DatabaseHelper databaseHelper;

  SqliteRepository(this.databaseHelper);

  @override
  Future<Map<String, dynamic>> getLastSurat() async {
    try {
      final result = await databaseHelper.getLastSurat();
      if (result == null) {
        return {};
      } else {
        return result;
      }
    } catch (e) {
      throw Exception("Error Get last surat");
    }
  }

  @override
  Future<String> insertLastSurat(SuratModel surat) async {
    try {
      await databaseHelper.insertLastAyat(surat);
      return "Succses Add last Surat";
    } catch (e) {
      throw Exception("Error insert Last Surat");
    }
  }

  @override
  Future<String> removeLastSurat(SuratModel surat) async {
    try {
      await databaseHelper.removeLastSurat(surat);
      return "Sucsses remove last surat";
    } catch (e) {
      throw Exception("Error remove last surat");
    }
  }
}
