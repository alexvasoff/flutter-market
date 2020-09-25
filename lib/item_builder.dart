import 'package:flutter/material.dart';

import 'models.dart';

class ItemBuilder extends StatefulWidget {
  final int index;

  ItemBuilder(this.index);

  //вернуть элемент Item по индексу
  Item curItem(index) => ItemsStorage.getInstance().items[index];

  @override
  _ItemBuilderState createState() => _ItemBuilderState(curItem(index));
}

class _ItemBuilderState extends State<ItemBuilder> {
  final Item curItem;
  bool isNoticed = false;

  _ItemBuilderState(this.curItem);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: isNoticed ? moreInformation() : basicInformation(),
      onTap: () {
        setState(() {
          isNoticed = !isNoticed;
        });
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
              ],
            ),
            // разделитель
            Divider(height: 10.0),
          ],
        ));
  }

// отрисовка подробного описания товара
  Widget moreInformation() {
    return Container(
      padding: EdgeInsets.all(10),
      child: Column(
        children: [
          // картинка
          Container(
            margin: EdgeInsets.all(10),
            width: 360,
            height: 180,
            child: Image.asset(
              '${curItem.img}',
              fit: BoxFit.contain,
            ),
          ),
          // строка [Название    цена]
          Container(
            margin: EdgeInsets.only(top: 20, left: 10),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    "Название: ${curItem.name}",
                    style: TextStyle(fontSize: 18),
                    softWrap: true,
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(right: 50),
                  child: Text(
                    "Цена: ${curItem.price}",
                    style: TextStyle(fontSize: 18),
                  ),
                )
              ],
            ),
          ),
          // описание
          Container(
              margin: EdgeInsets.all(10),
              alignment: Alignment.bottomLeft,
              child: Text(
                "Описание:\n${curItem.description}",
                style: TextStyle(fontSize: 16),
                softWrap: true,
              )),
          Divider(height: 10.0),
        ],
      ),
    );
  }
}
