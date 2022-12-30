import 'package:sqflite/sqflite.dart';

class QuranDatabaseHelper {
  static QuranDatabaseHelper? _databaseHelper;
  QuranDatabaseHelper._instance() {
    _databaseHelper = this;
  }

  factory QuranDatabaseHelper() =>
      _databaseHelper ?? QuranDatabaseHelper._instance();

  static Database? _database;

  Future<Database?> get database async {
    _database ??= await _initDb();
    return _database;
  }

  static const String _tableBookmark = "bookmark";

  Future<Database> _initDb() async {
    final path = await getDatabasesPath();
    final databasePath = "$path/surah.db";

    var db = await openDatabase(databasePath, version: 1, onCreate: _onCreate);

    return db;
  }

  void _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE $_tableBookmark (
        id INTEGER PRIMARY KEY,
        name TEXT,
        number INTEGER,
      );
    ''');
  }

  Future<int> insertBookmark(surah) async {
    final db = await database;
    return await db!.insert(_tableBookmark, surah.toJson());
  }
}
