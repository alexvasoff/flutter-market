import 'package:flutter/material.dart';

import 'models.dart';

class SecondRoute extends StatelessWidget {
  final Item curItem;
  final String name;

  const SecondRoute({Key key, this.curItem, this.name}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Widget: $name'),
      ),
      body: SingleChildScrollView(
        child: Container(
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
            ],
          ),
        ),
      ),
    );
  }
}
