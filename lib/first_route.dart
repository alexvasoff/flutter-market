import 'package:flutter/material.dart';

import 'models/item_model.dart';
import 'storage/cart_storage.dart';

class FirstRoute extends StatelessWidget {
  final Item curItem;
  const FirstRoute({Key key, this.curItem}) : super(key: key);

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
                          print("Уже в корзине!");
                          return;
                        }
                        Cart.getInstance().addItemToMap(curItem);
                        print('Добавлен!');
                        print(Cart.getInstance().getAllItems.length);
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
