import 'package:flutter/cupertino.dart';
import 'package:flutter_learn/test.dart';

class Parser extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: DefaultAssetBundle.of(context).loadString('assets/ItemData.json'),
      builder: (context, snapshot) {
        var myJson = ItemsStorage.fromJsonArray(snapshot.toString());
        return Text(myJson.toString());
      },
    );
  }
}
