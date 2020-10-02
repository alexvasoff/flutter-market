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
        body: FutureBuilder(
          future:
              DefaultAssetBundle.of(context).loadString('assets/ItemData.json'),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              ItemsStorage.allItems = ItemsStorage.fromJsonArray(snapshot.data);
              return ListView.builder(
                  itemCount: ItemsStorage.getInstance().items.length,
                  itemBuilder: (context, index) {
                    return ItemBuilder(index);
                  });
            }
            return CircularProgressIndicator();
          },
        ));
  }
}
