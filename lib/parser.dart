import 'package:flutter/material.dart';

import 'package:flutter_learn/test.dart';

class Parser extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: DefaultAssetBundle.of(context).loadString("assets/ItemData.json"),
      builder: (context, snapshot) {
        var mList = ItemsStorage.fromJsonArray(snapshot.data.toString());
        return Text(mList[0].name);
      },
    );
  }
}
