import 'package:flutter/material.dart';
import 'package:flutter_learn/routes/item_card.dart';
import 'package:flutter_learn/routes/item_detail.dart';
import 'package:flutter_learn/storage/item_storage.dart';
import 'models/item_model.dart';

class ItemBuilder extends StatelessWidget {
  final int index;

  ItemBuilder(this.index);

  //вернуть элемент Item по индексу
  Item curItem() => ItemsStorage.getInstance().items[index];

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      child: Container(
        child: ItemCard(
          curItem: ItemsStorage.getInstance().items[index],
        ),
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
