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
      theme: ThemeData(primarySwatch: Colors.red),
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Классное название!"),
        ),
        body: ShowCase());
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
        decoration: BoxDecoration(border: Border.all()),
        margin: EdgeInsets.fromLTRB(0, 10, 5, 0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Card(
              elevation: 20,
              child: Image.network(
                'https://im.jigsawplanet.com/?rc=img&pid=22c354cf3317&size=160',
                width: 80,
                height: 80,
                fit: BoxFit.cover,
              ),
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
            child: Image.network(
                'https://im.jigsawplanet.com/?rc=img&pid=22c354cf3317&size=160'),
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
