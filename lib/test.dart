import 'dart:convert';
import 'dart:io';
import 'package:flutter_learn/json_parse.dart';
import 'package:path_provider/path_provider.dart';

main() {
  print(ItemsStorage.getInstance().items.toString());
}

// пример кодирования в JSON

class Item {
  final String name;
  final String description;
  final num price;
  final String img;

  Item(this.name, this.description, this.img, this.price);
}

class ItemsStorage {
  ItemsStorage._internal();
  static ItemsStorage _itemsStotage = ItemsStorage._internal();
  static ItemsStorage getInstance() => _itemsStotage;

  static Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();

    return directory.path;
  }

  static Future<File> get _localFile async {
    final path = await _localPath;
    return File('$path/ItemsData');
  }

  static Future<String> readJson() async {
    try {
      final file = await _localFile;

      // Read the file.
      String contents = await file.readAsString();

      return contents;
    } catch (e) {
      // If encountering an error, return 0.
      return '';
    }
  }

  static Item fromJsonMap(Map<String, dynamic> json) {
    String name = json["name"];
    String description = json["description"];
    num price = json["price"];
    String img = json["img"];

    Item i = new Item(name, description, img, price);
    return i;
  }

  static List<Item> fromJsonArray(String jsonString) {
    print(jsonString);
    Map<String, dynamic> decodeMap = jsonDecode(jsonString);
    List<dynamic> dynamicList = decodeMap["Items"];
    List<Item> items = new List<Item>();
    dynamicList.forEach((element) {
      Item i = ItemsStorage.fromJsonMap(element);
      items.add(i);
    });
    return items;
  }

  List<Item> _allItems = ItemsStorage.fromJsonArray(GetJson().getJson());
//  List<Item> get items => ItemsStorage.fromJsonArray(File("assets/ItemsData").readAsStringSync());
  List<Item> items;
}
