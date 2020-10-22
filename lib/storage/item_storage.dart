import 'dart:convert';

import 'package:flutter_learn/models/item_model.dart';

class ItemsStorage {
  static List<Item> _allItems = new List<Item>();

  ItemsStorage._internal();

  static ItemsStorage _itemsStorage = ItemsStorage._internal();

  List<Item> get items => _allItems;

  static ItemsStorage getInstance() => _itemsStorage;

  static Item findById(int itemId) {
    Item res = _allItems.firstWhere((element) => element.id == itemId,
        orElse: () => null);
    return res;
  }

  static Item fromJsonMap(Map<String, dynamic> json) {
    int id = json["id"];
    String name = json["name"];
    String description = json["description"];
    num price = json["price"];
    String img = json["img"];

    return Item(id, name, description, img, price);
  }

  static void fromJsonArray(String jsonString) {
    Map<String, dynamic> decodeMap = jsonDecode(jsonString);
    List<dynamic> dynamicList = decodeMap["Items"];
    dynamicList.forEach((element) {
      Item i = ItemsStorage.fromJsonMap(element);
      if (findById(i.id) != null) return;
      _allItems.add(i);
    });
  }
}
