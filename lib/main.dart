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
      // body: Center(child: Container(child: Text("Добрый день!"))),
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
      child: ListView.builder(
        padding: EdgeInsets.all(10.0),
        itemBuilder: (context, index) {
          if (index.isOdd)
            return Divider(
              height: 16.0,
            );
          // ignore: missing_return
          final i = index ~/ 2;
          if (i < itemsCount)
            return (ItemBuilder());
        },
      ),
    );
  }
}

class ItemBuilder extends StatefulWidget {
  @override
  _ItemBuilderState createState() => _ItemBuilderState();
}

class _ItemBuilderState extends State<ItemBuilder> {
  bool isNoticed = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListTile(
        title: Text("ТОВАР"),
      ),
    );
  }
}
