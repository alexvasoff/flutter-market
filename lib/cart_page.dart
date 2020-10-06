import 'package:flutter/material.dart';

import 'storage/cart_storage.dart';

class CartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('KORZINA'),
        ),
        body: ListView.builder(
          itemCount: Cart.itemsInCart.length,
          itemBuilder: (context, index) {
            //TODO: отрисовать карточку товара в корзине
            return Text(Cart.itemsInCart.keys.toList()[index].name);
          },
        ));
  }
}
