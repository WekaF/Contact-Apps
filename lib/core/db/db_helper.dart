import 'package:apptest_tog/core/models/user.dart';
import 'package:sqflite/sqflite.dart';

class DbHelper {
  static Database? _db;
  static const int _ver = 1;
  static const String _tableName = 'final';

  static Future<void> initDB() async {
    if (_db != null) {
      return;
    }
    try {
      String _path = await getDatabasesPath() + 'final.db';
      _db = await openDatabase(_path, version: _ver, onCreate: (db, version) {
        print("creating a new one");
        return db.execute(
          "CREATE TABLE $_tableName("
          "id INTEGER PRIMARY KEY AUTOINCREMENT, nama STRING, alamat TEXT, tanggal STRING, tinggi STRING, berat STRING, foto TEXT ) "
        
        );
      });
    } catch (e) {
      print(e);
    }
  }


  static Future<int> insert(User user) async {
    print("insert function called");
    return await _db!.insert(_tableName, user.toMap());
  }


  static Future<List<Map<String, dynamic>>> query() async {
    print("query function called");
    return await _db!.query(_tableName);
  }

  static delete(User user) async {
    return await _db!.delete(_tableName, where: 'id=?', whereArgs: [user.id]);
  }



}
