import 'dart:convert';
import 'dart:io';

import 'dart:async' show Future;
import 'package:flutter/services.dart' show rootBundle;

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

  static Item fromJsonMap(Map<String, dynamic> json) {
    String name = json["name"];
    String description = json["description"];
    num price = json["price"];
    String img = json["img"];

    Item i = new Item(name, description, img, price);
    return i;
  }

  static List<Item> items;
  static Future<void> fromJsonArray() async {
    String json = await rootBundle.loadString('assets/ItemData.json');
    Map<String, dynamic> decodeMap = jsonDecode(json);
    List<dynamic> dynamicList = decodeMap["Items"];
    dynamicList.forEach((element) {
      Item i = ItemsStorage.fromJsonMap(element);
      items.add(i);
    });
  }

  Future<String> getJson() async {
    final String file = await rootBundle.loadString('assets/ItemData.json');
    return file;
  }
}
