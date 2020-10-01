import 'package:flutter/material.dart';

import 'item_builder.dart';
import 'test.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Flutter Widgets Store"),
        ),
        body: Container(
          child: ListView.builder(
            padding: EdgeInsets.all(10.0),
            itemCount: ItemsStorage.items.length,
            itemBuilder: (context, index) {
              return ItemBuilder(index);
            },
          ),
        ));
  }
}
