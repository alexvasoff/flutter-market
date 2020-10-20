import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

import 'models/item_model.dart';

class DB {
  DB._internal();

  static final DB db = DB._internal();
  static Database _database;

  Future<Database> get database async {
    print("Проверяем базу");
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

  addItemToDB(Item item) async {
    print("Устанавливаем бд");
    final db = await database;
    print(
        "Добавлен элемент ${item.id}  ${item.name} в базу (я на это надеюсь...)");
    return await db
        .rawInsert("INSERT INTO favorite(itemId) VALUES(?)", [item.id]);
  }

  removeItemFromDB(Item item) async {
    print("Устанавливаем бд");
    final db = await database;
    print("Ну а сейчас удаляем запись... ${item.id}  ${item.name}");
    var res =
        await db.rawDelete("DELETE FROM favorite WHERE itemId = ?", [item.id]);
    print("V rezultate poluchaem res: $res");
    return res;
  }

  Future<bool> findItemInDB(Item item) async {
    print("Устанавливаем бд");
    final db = await database;
    print("Ищим элемент ${item.name} в базе...");
    var res =
        await db.rawQuery("SELECT * FROM favorite WHERE itemId = ?", [item.id]);
    print("Поиск завершен, в результате получаем строку: $res");
    if (res.length > 0) return true;
    return false;
  }
}
