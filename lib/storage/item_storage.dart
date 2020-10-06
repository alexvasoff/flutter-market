import 'dart:convert';

import 'package:flutter_learn/models/item_model.dart';

class ItemsStorage {
  static List<Item> _allItems = new List<Item>();

  ItemsStorage._internal();

  static ItemsStorage _itemsStorage = ItemsStorage._internal();

  static ItemsStorage getInstance() => _itemsStorage;

  List<Item> get items => _allItems;

  static Item fromJsonMap(Map<String, dynamic> json) {
    String name = json["name"];
    String description = json["description"];
    num price = json["price"];
    String img = json["img"];

    Item i = new Item(name, description, img, price);
    return i;
  }

  static void fromJsonArray(String jsonString) {
    Map<String, dynamic> decodeMap = jsonDecode(jsonString);
    List<dynamic> dynamicList = decodeMap["Items"];
    dynamicList.forEach((element) {
      Item i = ItemsStorage.fromJsonMap(element);
      _allItems.add(i);
    });
  }
}
