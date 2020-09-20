import 'package:flutter/material.dart';
import 'package:flutter_learn/models.dart';
import 'package:flutter/rendering.dart' show debugPaintSizeEnabled;

void main() {
  debugPaintSizeEnabled = false;
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Title of application!",
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Flutter Widgets Store"),
      ),
      body: ShowCase(),
    );
  }
}

class ShowCase extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final int itemsCount = ItemsStorage().items.length;
    return Container(
      child: ListView(
        padding: EdgeInsets.all(10),
        children: [
          // вызываем отрисовку для каждого элемента в ItemsStorage
          for (int i = 0; i < itemsCount; i++) ItemBuilder(i),
        ],
      ),
    );
  }
}

//построитель отображения элементов
class ItemBuilder extends StatefulWidget {
  final int index;

  ItemBuilder(this.index);

  //вернуть элемент Item по индексу
  Item curItem(index) => ItemsStorage().items[index];

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

//отрисовка "превью" товара
  Widget basicInformation() {
    return Container(
        margin: EdgeInsets.fromLTRB(0, 10, 5, 0),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
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
                Flexible(
                  fit: FlexFit.loose,
                  child: Container(
                      margin: const EdgeInsets.only(left: 20),
                      child: Text(
                        "${curItem.name}",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      )),
                )
              ],
            ),
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
          Container(
            margin: EdgeInsets.all(10),
            width: 360,
            height: 180,
            child: Image.asset(
              '${curItem.img}',
              fit: BoxFit.contain,
            ),
          ),
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
