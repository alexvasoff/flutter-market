import 'routes/item_card.dart';
import 'models/item_model.dart';
import 'package:flutter/material.dart';
import 'file:///D:/AndroidStudioProjects/flutter_learn/lib/routes/item_detail.dart';
import 'package:flutter_learn/storage/item_storage.dart';

class ItemBuilder extends StatelessWidget {
  final int index;

  ItemBuilder(this.index);

  //вернуть элемент Item по индексу
  Item curItem() => ItemsStorage.getInstance().items[index];

  @override
  Widget build(BuildContext context) {
    //TODO: Обработать нажатия
    return GestureDetector(
      child: ItemCard(
        curItem: ItemsStorage.getInstance().items[index],
      ),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ItemDetail(
              curItem: curItem(),
              title: curItem().name,
            ),
          ),
        );
      },
    );
  }
}
