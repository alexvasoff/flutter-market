import 'package:flutter/material.dart';
import 'package:flutter_learn/models.dart';
import 'package:flutter_learn/try_the_ui.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Title of application!",
      home: HomePage(),
      theme: ThemeData(primarySwatch: Colors.red),
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
        body: MyContainer());
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
      onTap: () {
        setState(() {
          isNoticed = !isNoticed;
        });
      },
      child: isNoticed ? moreInformation() : basicInformation(),
    );
  }

  Widget basicInformation() {
    return Container(
        padding: EdgeInsets.all(10),
        child: Row(
          children: [
            Image.network(
                'https://im.jigsawplanet.com/?rc=img&pid=22c354cf3317&size=160'),
            Text("${allItems[index].name}")
          ],
        ));
  }

  Widget moreInformation() {
    return Container(
      padding: EdgeInsets.all(10),
      child: ListTile(
        title: Text('${allItems[index].name}'),
        trailing: Icon(Icons.extension),
        subtitle: Text(
            "${allItems[index].description} по цене ${allItems[index].price}"),
      ),
    );
  }
}
