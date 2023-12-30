import 'dart:async';
import 'package:sqflite/sqflite.dart';
import 'package:transliteration/models/transliteration.dart';

class DatabaseHelper {
  static Database? db;
  static DatabaseHelper? dbHelper;

  String transliterationTable = 'transliteration';
  String transliterationID = 'id';
  String inputPath = 'input_path';
  String outputPath = 'output_path';
  String outputName = 'output_name';
  String timestamp = 'timestamp';

  DatabaseHelper._createInstance();

  factory DatabaseHelper() {
    dbHelper ??= DatabaseHelper._createInstance();

    return dbHelper!;
  }

  Future<Database> get database async {
    db ??= await initDB();

    return db!;
  }

  Future<Database> initDB() async {
    final dbPath = await getDatabasesPath();
    String path = '$dbPath/transliteration.db';

    return openDatabase(path, version: 1, onCreate: createDB);
  }

  createDB(Database db, int version) async {
    await db.execute('''
         CREATE TABLE $transliterationTable(
          $transliterationID INTEGER PRIMARY KEY AUTOINCREMENT,
          $inputPath TEXT,
          $outputPath TEXT,
          $outputName TEXT,
          $timestamp TIMESTAMP
         )
      ''');
  }

  Future<List<Map<String, dynamic>>> fetchAllTransliteration() async {
    Database db = await database;
    return await db.query(transliterationTable, orderBy: '$timestamp DESC');
  }

  Future<List<Map<String, dynamic>>> fetchNewestTransliterations(int limit) async {
    Database db = await DatabaseHelper().database;

    return await db.query(transliterationTable, orderBy: '$timestamp DESC', limit: limit);
  }

  Future<List<Map<String, dynamic>>> readTransliteration(int id) async {
    Database db = await database;

    return await db.query(transliterationTable, where: 'id = ?', whereArgs: [id], limit: 1);
  }

  Future<int> insertTransliteration(Transliteration transliteration) async {
    Database db = await database;

    return await db.insert(transliterationTable, transliteration.toMap(), conflictAlgorithm: ConflictAlgorithm.fail);
  }

  Future<int> deleteTransliteration(int id) async {
    Database db = await database;

    return await db.rawDelete('DELETE FROM $transliterationTable WHERE $transliterationID = $id');
  }

  Future<int?> getCount() async {
    Database db = await database;

    List<Map<String, dynamic>> count = await db.rawQuery('SELECT COUNT (*) from $transliterationTable');

    return Sqflite.firstIntValue(count);
  }
}
