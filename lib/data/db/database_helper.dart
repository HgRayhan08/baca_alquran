import 'package:aplikasi_suara_ilahi/domain/entitas/surat_model.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  static DatabaseHelper? _databaseHelper;
  DatabaseHelper._instance() {
    _databaseHelper = this;
  }

  factory DatabaseHelper() => _databaseHelper ?? DatabaseHelper._instance();

  static Database? _database;

  Future<Database> get database async {
    _database = await _initDb();
    return _database!;
  }

  static const String _tblLastSurat = 'lastSurat';

  Future<Database> _initDb() async {
    final path = await getDatabasesPath();
    final databasePath = '$path/suaraIlahi.db';

    var db = await openDatabase(
      databasePath,
      version: 1,
      onCreate: _onCreate,
    );
    return db;
  }

  void _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE  $_tblLastSurat (
        id INTEGER PRIMARY KEY,
        surat TEXT,
        code INTEGER
      );
    ''');
  }

  Future<int> insertLastAyat(SuratModel surat) async {
    final db = await database;
    // return await db!.insert(_tblLastSurat, surat.toJson());
    return await db.insert(
      _tblLastSurat,
      {
        'id': 1,
        'surat': surat.data.namaLatin,
        'code': surat.data.nomor,
      },
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<int> removeLastSurat(SuratModel surat) async {
    final db = await database;
    return await db.delete(
      _tblLastSurat,
      where: 'id = ?',
      whereArgs: [surat.code],
    );
  }

  Future<Map<String, dynamic>?> getLastSurat() async {
    // final db = await database;
    // final Map<String, dynamic> results = await db!.query(
    //   _tblLastSurat,
    // );

    // return results;
    final db = await database; // Pastikan database sudah diinisialisasi
    final result = await db.query(
      _tblLastSurat, // Nama tabel
      where: 'id = ?', // Cari data berdasarkan id
      whereArgs: [1], // Argumen untuk kondisi where
      limit: 1, // Batasi hanya satu hasil
    );

    if (result.isNotEmpty) {
      return result.first; // Kembalikan data pertama jika ada
    }
    return null; // Kembalikan null jika tidak ada data
  }
}
