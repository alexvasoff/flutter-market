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
    Item(
        name: "Container",
        description: "s",
        price: 10,
        img: "images/Container.png"),
    Item(
        name: "ListView",
        description: "desc",
        price: 10,
        img: "images/ListView.png"),
    Item(
        name: "ListTile",
        description: "desc",
        price: 10,
        img: "images/ListTile.png"),
    Item(
        name: "Flexible",
        description: "desc",
        price: 10,
        img: "images/Flexible.png"),
    Item(
        name: "Expanded",
        description: "desc",
        price: 10,
        img: "images/Expanded.png"),
    Item(
        name: "SafeArea",
        description: "desc",
        price: 10,
        img: "images/SafeArea.png"),
    Item(
        name: "Spacer",
        description: "desc",
        price: 10,
        img: "images/Spacer.png"),
    Item(
        name: "Opacity",
        description: "desc",
        price: 10,
        img: "images/Opacity.png"),
    Item(
        name: "Draggable",
        description: "desc",
        price: 10,
        img: "images/Draggable.png"),
    Item(
        name: "SizedBox",
        description: "desc",
        price: 10,
        img: "images/SizedBox.png"),
    Item(
        name: "Stack", description: "desc", price: 10, img: "images/Stack.png"),
    Item(
        name: "Table", description: "desc", price: 10, img: "images/Table.png"),
    Item(name: "Wrap", description: "desc", price: 10, img: "images/Wrap.png"),
  ];

  UnmodifiableListView<Item> get items => UnmodifiableListView(_items);
}
