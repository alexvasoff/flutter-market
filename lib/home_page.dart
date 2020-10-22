import 'package:flutter/material.dart';
import 'package:flutter_learn/models/item_model.dart';
import 'package:flutter_learn/routes/cart_page.dart';
import 'package:flutter_learn/storage/item_storage.dart';
import 'item_builder.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<Item> items = ItemsStorage.getInstance().items;
    return Scaffold(
      appBar: AppBar(
        title: Text("Flutter Widgets Store"),
        actions: [
          IconButton(
            padding: const EdgeInsets.only(right: 15),
            icon: Icon(Icons.shopping_basket),
            tooltip: "Перейти в корзину",
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => CartPage()));
            },
          ),
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
                itemCount: items.length,
                itemBuilder: (context, index) {
                  return ItemBuilder(items[index].id);
                });
          }
          return Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
