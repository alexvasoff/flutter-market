import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'models/item_model.dart';

class FavoriteDB {
  FavoriteDB._internal();

  static final FavoriteDB db = FavoriteDB._internal();
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
          id INTEGER PRIMARY KEY,
          itemId INTEGER            
        )""");
    }, version: 1);
  }

  addItem(Item item) async {
    final db = await database;
    return await db
        .rawInsert("INSERT INTO favorite(itemId) VALUES(?)", [item.id]);
  }

  deleteItem(Item item) async {
    final db = await database;
    return await db
        .rawDelete("DELETE FROM favorite WHERE itemId = ?", [item.id]);
  }

  Future<bool> findItem(Item item) async {
    final db = await database;
    var res =
        await db.rawQuery("SELECT * FROM favorite WHERE itemId = ?", [item.id]);
    if (res.length > 0) return true;
    return false;
  }
}
