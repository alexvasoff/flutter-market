import 'first_route.dart';
import 'models/item_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_learn/second_route.dart';
import 'package:flutter_learn/storage/item_storage.dart';

class ItemBuilder extends StatelessWidget {
  final int index;

  ItemBuilder(this.index);

  //вернуть элемент Item по индексу
  Item curItem() => ItemsStorage.getInstance().items[index];

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: FirstRoute(
        curItem: ItemsStorage.getInstance().items[index],
      ),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => SecondRoute(
              curItem: curItem(),
              title: curItem().name,
            ),
          ),
        );
      },
    );
  }
}
