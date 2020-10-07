import 'package:flutter/material.dart';
import 'package:flutter_learn/models/item_model.dart';
import 'package:flutter_learn/storage/cart_storage.dart';

class ItemCard extends StatelessWidget {
  final Item curItem;
  const ItemCard({Key key, this.curItem}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.fromLTRB(0, 10, 5, 0),
        child: Column(
          children: [
            // строка [Картинка  название]
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // картинка
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
                // название
                Expanded(
                  child: Container(
                      margin: const EdgeInsets.only(left: 20),
                      child: Text(
                        "${curItem.name}",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      )),
                ),
                Container(
                  alignment: Alignment.topRight,
                  child: Text(
                    "${curItem.price}",
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        color: Colors.grey.shade700),
                  ),
                ),
                Container(
                  child: IconButton(
                      icon: Icon(
                        Icons.add_shopping_cart,
                        color: Colors.cyan,
                      ),
                      onPressed: () {
                        //TODO: Вынести реализацию в отдельный метод
                        if (Cart.getInstance().getAllItems.contains(curItem)) {
                          Scaffold.of(context).showSnackBar(SnackBar(
                            content: Text('Товар уже добавлен в корзину!'),
                            backgroundColor: Colors.blue,
                            duration: Duration(seconds: 1),
                          ));
                          return;
                        }
                        Cart.getInstance().addItemToMap(curItem);
                        Scaffold.of(context).showSnackBar(SnackBar(
                          content: Text('Товар добавлен в корзину!'),
                          backgroundColor: Colors.blue,
                          duration: Duration(seconds: 1),
                        ));
                      }),
                ),
              ],
            ),
            // разделитель
            Divider(height: 10.0),
          ],
        ));
  }
}
