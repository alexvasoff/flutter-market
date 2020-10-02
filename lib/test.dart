import 'dart:convert';

itemsFromJsonArray(String json) => ItemsStorage.fromJsonArray(json);

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

  static List<Item> allItems;
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

  List<Item> get items => allItems;
}
