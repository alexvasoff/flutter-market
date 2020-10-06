import 'package:flutter/material.dart';
import 'package:flutter_learn/order.dart';

class Cart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('KORZINA'),
        ),
        body: ListView.builder(
          itemCount: itemsInCart.length,
          itemBuilder: (context, index) {
            return Text(itemsInCart[index].name);
          },
        ));
  }
}
