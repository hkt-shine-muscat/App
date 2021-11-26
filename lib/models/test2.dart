import 'package:shine_muscat/models/test.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite/sqlite_api.dart';

final String TableName = 'memos';

Future<Database> database() async => await openDatabase(
      join(await getDatabasesPath(), 'memos.db'),
      onCreate: (db, version) {
        return db.execute(
          "CREATE TABLE memos(id INTEGER PRIMARY KEY, text TEXT)",
        );
      },
      version: 1,
    );

class DBHelper {
  DBHelper();

  // ignore: non_constant_identifier_names
  static var INSTANCE = new DBHelper();

  /*Future<Database> get database async {
    if (_db != null) return _db;
    _db = openDatabase(
      join(await getDatabasesPath(), 'memos.db'),
      onCreate: (db, version) {
        return db.execute(
          "CREATE TABLE memos(id INTEGER PRIMARY KEY, text TEXT)",
        );
      },
      version: 1,
    );
    return _db;
  }*/

  static Future<void> insertMemo(Memo memo) async {
    final Database db = await database();

    await db.insert(
      TableName,
      memo.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  static Future<List<Memo>> memos() async {
    final Database db = await database();

    final List<Map<String, dynamic>> maps = await db.query('memos');

    return List.generate(maps.length, (i) {
      return Memo(
        id: maps[i]['id'],
        text: maps[i]['text'],
      );
    });
  }

  Future<void> updateMemo(Memo memo) async {
    final Database db = await database();

    await db.update(
      TableName,
      memo.toMap(),
      where: "id = ?",
      whereArgs: [memo.id],
    );
  }

  Future<void> deleteMemo(int id) async {
    final Database db = await database();

    await db.delete(
      TableName,
      where: "id = ?",
      whereArgs: [id],
    );
  }
}
