import 'package:flutter/material.dart';
import 'package:flutter_learn/cart_page.dart';
import 'package:flutter_learn/storage/item_storage.dart';
import 'item_builder.dart';

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
              tooltip: "Перейти в корзину",
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => CartPage()));
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
