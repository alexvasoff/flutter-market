import 'package:flutter/material.dart';

import 'item_builder.dart';
import 'models.dart';

class ShowCase extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
        padding: EdgeInsets.all(10.0),
        itemCount: ItemsStorage.getInstance().items.length,
        itemBuilder: (context, index) {
          return ItemBuilder(index);
        },
      ),
    );
  }
}
