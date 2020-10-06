import 'package:flutter/material.dart';
import 'package:flutter_learn/cart.dart';
import 'item_builder.dart';
import 'models.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Flutter Widgets Store"),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 15),
            child: IconButton(
              icon: Icon(Icons.shopping_basket),
              onPressed: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => Cart()));
              },
            ),
          )
        ],
      ),
      body: FutureBuilder(
        future:
            DefaultAssetBundle.of(context).loadString('assets/ItemsData.json'),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            ItemsStorage.fromJsonArray(snapshot.data);
            return ListView.builder(
                padding: EdgeInsets.all(10.0),
                itemCount: ItemsStorage.getInstance().items.length,
                itemBuilder: (context, index) {
                  return ItemBuilder(index);
                });
          }
          return Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
