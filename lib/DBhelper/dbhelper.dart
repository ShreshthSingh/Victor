import 'package:sqflite/sqflite.dart' as sql;
import 'package:sqflite/sqlite_api.dart';
import 'package:path/path.dart' as path;

class DBhelper {
  static Future<Database> database() async {
    final dbPath = await sql.getDatabasesPath();

    return sql.openDatabase(path.join(dbPath, 'meals.db'),
        onCreate: (db, version) {
      return db.execute(
          'CREATE TABLE user_meals(id TEXT PRIMARY_KEY,name TEXT,protein TEXT,fat TEXT,carbs TEXT,calories TEXT)');
    }, version: 1);
  }

  static Future<void> insert(String table, Map<String, Object> data) async {
    final db = await DBhelper.database();
    db.insert(table, data, conflictAlgorithm: sql.ConflictAlgorithm.replace);
  }

  static Future<List<Map<String, dynamic>>> getData(String table) async {
    final db = await DBhelper.database();
    return db.query(table);
  }

  static Future<void> deleteRecord(String id, String table) async {
    final db = await DBhelper.database();
    await db.rawDelete('DELETE FROM $table WHERE id = ?', ['$id']);
  }
}
