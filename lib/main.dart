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
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(
        children: [ItemBuilder()],
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


