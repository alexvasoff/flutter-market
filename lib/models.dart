import 'dart:collection';

import 'package:flutter/foundation.dart';

class Item {
  final String name;
  final String description;
   num price;
  final String img;

  Item(this.name, this.description, this.price, this.img);

}

class ItemsStorage {
  List<Item> _items = [
    Item("1", "desc", 12, "img"),
    Item("2", "desc", 12, "img"),
    Item("3", "desc", 12, "img"),
    Item("4", "desc", 12, "img"),
    Item("5", "desc", 12, "img"),
    Item("6", "desc", 12, "img"),
  ];

  UnmodifiableListView<Item> get items => UnmodifiableListView(_items);

}



