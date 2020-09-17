import 'package:flutter/material.dart';
import 'package:flutter_learn/models.dart';

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

  Widget basicInformation() {
    return Container(
        child: ListTile(
      title: Text('${allItems[index].name}'),
      trailing: Icon(Icons.picture_in_picture),
    ));
  }

  Widget moreInformation() {
    return Text("Тут много инфы");
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListTile(
        title: Text('${allItems[index].price}'),
        onTap: () {
          setState(() {
            allItems[index].price += 1;
          });
        },
      ),
    );
  }
}
