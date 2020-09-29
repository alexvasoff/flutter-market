import 'package:flutter/material.dart';
import 'package:flutter_learn/second_route.dart';
import 'models.dart';

class ItemBuilder extends StatelessWidget {
  final int index;
  ItemBuilder(this.index);

  //вернуть элемент Item по индексу
  Item curItem() => ItemsStorage.getInstance().items[index];
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: basicInformation(),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => SecondRoute(
              curItem: curItem(),
              name: curItem().name,
            ),
          ),
        );
      },
    );
  }

  Widget basicInformation() {
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
                        image: Image.asset('${curItem().img}').image),
                  ),
                ),
                // название
                Expanded(
                  child: Container(
                      margin: const EdgeInsets.only(left: 20),
                      child: Text(
                        "${curItem().name}",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      )),
                ),
              ],
            ),
            // разделитель
            Divider(height: 10.0),
          ],
        ));
  }
}
