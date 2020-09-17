import 'dart:collection';

import 'package:flutter/foundation.dart';

class Item {
  final String name;
  final String description;
  num price;
  final String img;

  Item(
      {@required this.name,
      @required this.description,
      @required this.price,
      @required this.img});
}

class ItemsStorage {
  List<Item> _items = [
    Item(name: "1", description: "desc", price: 10, img: "img"),
    Item(name: "2", description: "desc", price: 10, img: "img"),
    Item(name: "3", description: "desc", price: 10, img: "img"),
    Item(name: "4", description: "desc", price: 10, img: "img"),
    Item(name: "5", description: "desc", price: 10, img: "img"),
    Item(name: "6", description: "desc", price: 10, img: "img"),
    Item(name: "7", description: "desc", price: 10, img: "img"),
  ];

  UnmodifiableListView<Item> get items => UnmodifiableListView(_items);
}
