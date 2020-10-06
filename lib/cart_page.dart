import 'package:flutter/material.dart';

import 'models/item_model.dart';
import 'storage/cart_storage.dart';

class CartPage extends StatefulWidget {
  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Корзина'),
        ),
        body: ListView.builder(
          itemCount: Cart.getInstance().getAllItems.length + 1,
          itemBuilder: (context, index) {
            if (index < Cart.getInstance().getAllItems.length) {
              Item curItem = Cart.getInstance().getAllItems[index];
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
                                (curItem.price *
                                        Cart.getInstance().getMap[curItem])
                                    .toString(),
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
                                  onPressed: () {
                                    setState(() {
                                      if (Cart.getInstance().getMap[curItem] >
                                          1)
                                        Cart.getInstance().getMap[curItem]--;
                                    });
                                  }),
                              Text(Cart.getInstance()
                                  .getMap[curItem]
                                  .toString()),
                              IconButton(
                                  icon: Icon(Icons.add),
                                  onPressed: () {
                                    setState(() {
                                      Cart.getInstance().getMap[curItem]++;
                                    });
                                  }),
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
                // ignore: missing_return
              );
            }
            ;
            return Text(
              'Общая сумма: ${Cart.getInstance().totalPrice()}',
              style: TextStyle(fontSize: 16),
            );
          },
        ));
  }
}
