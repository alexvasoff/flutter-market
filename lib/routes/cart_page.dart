import 'package:flutter/material.dart';
import 'package:flutter_learn/models/item_model.dart';
import 'package:flutter_learn/storage/cart_storage.dart';

class CartPage extends StatefulWidget {
  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    List<Item> itemsInCart = Cart.getInstance().getAllItems;
    return Scaffold(
      appBar: AppBar(
        title: Text('Корзина'),
      ),
      body: ListView.builder(
        itemCount: itemsInCart.length,
        itemBuilder: (context, index) {
          Item curItem = Cart.getInstance().findById(itemsInCart[index].id);
          return Container(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    imageSection(curItem),
                    itemInCart(curItem),
                    Container(
                      margin: EdgeInsets.only(top: 20),
                      child: Row(
                        children: [
                          IconButton(
                              icon: Icon(Icons.remove),
                              onPressed: () {
                                setState(() {
                                  if (Cart.getInstance().getMap[curItem] > 1)
                                    Cart.getInstance().getMap[curItem]--;
                                });
                              }),
                          SizedBox(
                              width: 18,
                              child: Text(
                                Cart.getInstance().getMap[curItem].toString(),
                                textAlign: TextAlign.center,
                                style: TextStyle(fontSize: 16),
                              )),
                          IconButton(
                              icon: Icon(Icons.add),
                              onPressed: () {
                                setState(() {
                                  Cart.getInstance().getMap[curItem]++;
                                });
                              }),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 10),
                      child: IconButton(
                        icon: Icon(
                          Icons.close,
                          color: Colors.blueGrey,
                        ),
                        onPressed: () {
                          setState(() {
                            Cart.getInstance().getMap.remove(curItem);
                          });
                        },
                      ),
                    ),
                  ],
                ),
                Divider(
                  height: 10,
                )
              ],
            ),
          );
        },
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.white,
        child: ListTile(
          title: Text("Общая сумма: ${Cart.getInstance().totalPrice()} "),
          subtitle: Text("Позиций товара: ${Cart.getInstance().totalCount()}"),
          trailing: FlatButton(
            color: Colors.blue,
            textColor: Colors.white,
            onPressed: () {
              setState(() {
                Cart.getInstance().getMap.clear();
              });
              print('Считаем, что купили');
            },
            child: Text("Купить"),
          ),
        ),
      ),
    );
  }
}

Widget imageSection(curItem) {
  return Container(
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
      image: DecorationImage(image: Image.asset('${curItem.img}').image),
    ),
  );
}

Widget itemInCart(curItem) {
  return Expanded(
    child: Container(
      height: 90,
      margin: EdgeInsets.only(left: 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            curItem.name,
            style: TextStyle(
              fontSize: 18,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Text(
              (curItem.price * Cart.getInstance().getMap[curItem]).toString(),
              style: TextStyle(fontSize: 18),
            ),
          )
        ],
      ),
    ),
  );
}
