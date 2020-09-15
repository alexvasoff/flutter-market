import 'package:flutter/material.dart';

void main() {
  List<Item> items = [Item("1", "is one", 15,"111"), Item("2", "123", 5, "555")];
  print(items[0].price);
}

class Item extends StatelessWidget {

  final String name;
  final String img;
  final String description;
  final double price;

  Item(this.name, this.description, this.price, this.img);


  @override
  Widget build(BuildContext context) {
    return null;
  }
}