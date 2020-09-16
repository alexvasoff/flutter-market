import 'package:flutter/material.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Shop",
      home: Shop(),
    );
  }
}

class Shop extends StatefulWidget {
  @override
  _ShopState createState() => _ShopState();
}

class _ShopState extends State<Shop> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Widget Store"),
      ),
      body: _buildItems(),
      );
  }
}

Widget _buildItems() {
  return ListView(
    padding: EdgeInsets.all(8.0),
    children: itemRep,

  );
}


Widget itemRepresent(int index) {
  return ListTile(
    title: Text(items[index].name),
    subtitle: Text(items[index].description),
    leading: Icon(Icons.picture_in_picture),
  );



}

List<Widget> itemRep = [for (int i = 0; i < items.length; i++) itemRepresent(i)];


List<Item> items = [Item("1", "is one", 15,"111"), Item("2", "123", 5, "555")];


class Item extends StatelessWidget {

  final String name;
  final String img;
  final String description;
  final double price;

  Item(this.name, this.description, this.price, this.img);

  @override
  Widget build(BuildContext context) {
    return Text("$name это имя");
  }
}