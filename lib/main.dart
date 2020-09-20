import 'package:flutter/material.dart';
import 'package:flutter_learn/models.dart';
import 'package:flutter/rendering.dart' show debugPaintSizeEnabled;

void main() {
  debugPaintSizeEnabled = true;
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
        title: Text("Flutter Widget Store"),
      ),
      body: ShowCase(),
    );
  }
}

class ShowCase extends StatelessWidget {
  final List<Item> allItems = ItemsStorage().items;

  @override
  Widget build(BuildContext context) {
    final int itemsCount = allItems.length;
    return Container(
      child: ListView(
        padding: EdgeInsets.all(10),
        children: [
          for (int i = 0; i < itemsCount; i++) ItemBuilder(i),
        ],
      ),
    );
  }
}

class ItemBuilder extends StatefulWidget {
  final int index;

  ItemBuilder(this.index);

  @override
  _ItemBuilderState createState() => _ItemBuilderState(index);
}

class _ItemBuilderState extends State<ItemBuilder> {
  final int index;
  final List<Item> allItems = ItemsStorage().items;
  bool isNoticed = false;

  _ItemBuilderState(this.index);

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
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: 80,
              height: 80,
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
                    image: Image.asset('images/Expanded.png').image),
              ),
              margin: EdgeInsets.all(5),
            ),
            Flexible(
              fit: FlexFit.loose,
              child: Container(
                  margin: const EdgeInsets.only(left: 20),
                  child: Text(
                    "${allItems[index].name}",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  )),
            )
          ],
        ));
  }

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
              'images/Expanded.png',
              fit: BoxFit.contain,
            ),
          ),
          Container(
            margin: EdgeInsets.all(10),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    "Название: ${allItems[index].name}",
                    softWrap: true,
                  ),
                ),
                Text("Цена: ${allItems[index].price}"),
              ],
            ),
          ),
          Container(
              margin: EdgeInsets.all(10),
              alignment: Alignment.bottomLeft,
              child: Text(
                "Описание: ${allItems[index].description}",
                softWrap: true,
              )),
        ],
      ),
    );
  }
}
