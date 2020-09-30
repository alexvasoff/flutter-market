import 'package:flutter/material.dart';

import 'models.dart';

class SecondRoute extends StatelessWidget {
  final Item curItem;
  final String title;

  const SecondRoute({Key key, this.curItem, this.title}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Widget: $title'),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(10),
          child: Column(
            children: [
              imageSection(),
              titleSection(),
              descriptionSection(),
            ],
          ),
        ),
      ),
    );
  }

  Widget imageSection() {
    return Container(
      margin: EdgeInsets.all(10),
      width: 360,
      height: 225,
      child: Image.asset(
        '${curItem.img}',
        fit: BoxFit.cover,
      ),
    );
  }

  Widget titleSection() {
    return Container(
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
    );
  }

  Widget descriptionSection() {
    return Container(
      margin: EdgeInsets.only(top: 30, left: 10),
      alignment: Alignment.bottomLeft,
      child: Text(
        "${curItem.description}",
        style: TextStyle(
          fontSize: 18,
        ),
        softWrap: true,
      ),
    );
  }
}
