import 'package:flutter/material.dart';

import 'models/item_model.dart';
import 'storage/cart_storage.dart';

class CartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('KORZINA'),
        ),
        body: ListView.builder(
          itemCount: Cart.getInstance().getAllItems.length,
          itemBuilder: (context, index) {
            Item curItem = Cart.getInstance().getAllItems[index];
            //TODO: отрисовать карточку товара в корзине
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Row(
                    children: [
                      Container(
                        width: 80,
                        height: 80,
                        margin: EdgeInsets.symmetric(vertical: 5),
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey[200],
                              spreadRadius: 3,
                              blurRadius: 2,
                            )
                          ],
                          borderRadius: BorderRadius.circular(5),
                          image: DecorationImage(
                              image: Image.asset('${curItem.img}').image),
                        ),
                      ),
                      Container(
                        height: 90,
                        margin: EdgeInsets.only(left: 10),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              curItem.name,
                              style: TextStyle(
                                fontSize: 18,
                              ),
                            ),
                            Text(
                              (curItem.price * 2).toString(),
                              style: TextStyle(fontSize: 18),
                            )
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 64),
                        child: Row(
                          children: [
                            IconButton(
                              icon: Icon(Icons.remove),
                            ),
                            Text('10'),
                            IconButton(
                              icon: Icon(Icons.add),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                  Divider(
                    height: 10,
                  )
                ],
              ),
            );
          },
        ));
  }
}
