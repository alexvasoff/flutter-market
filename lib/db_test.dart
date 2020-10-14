import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

import 'models/item_model.dart';

class DB {
  DB._internal();
  static final DB db = DB._internal();
  static Database _database;

  Future<Database> get database async {
    if (_database != null) return _database;
    _database = await initDB();
    return _database;
  }

  Future<Database> initDB() async {
    return await openDatabase(join(await getDatabasesPath(), 'my_app.db'),
        onCreate: (db, version) async {
      await db.execute("""
        CREATE TABLE favorite (
          id INTEGER PRIMARY KEY, itemId INTEGER            
        )""");
    }, version: 1);
  }

  addItemToFavorite(Item item) async {
    final db = await database;

    return await db
        .rawInsert("INSERT INTO favorite(itemId) VALUES(?)", [item.id]);
  }
}
