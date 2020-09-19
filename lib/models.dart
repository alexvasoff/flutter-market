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
    Item(name: "Первый товар", description: "desc", price: 10, img: "img"),
    Item(name: "Второй товар", description: "desc", price: 10, img: "img"),
    Item(name: "Третий товар", description: "desc", price: 10, img: "img"),
    Item(name: "Четвертый товар", description: "desc", price: 10, img: "img"),
    Item(name: "Пятый товар", description: "desc", price: 10, img: "img"),
    Item(name: "Шестой товар", description: "desc", price: 10, img: "img"),
    Item(
        name:
            "фывыфвыфвфывфывфывыфвыфвфывывыфвфывыфвыфвфывфывыфвфывыфвфывыф товар",
        description: "desc",
        price: 10,
        img: "img"),
  ];

  UnmodifiableListView<Item> get items => UnmodifiableListView(_items);
}
