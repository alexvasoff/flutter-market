import 'package:flutter/material.dart';
import 'package:flutter_learn/random_word.dart';
import 'package:flutter_learn/tutorial_home.dart';

import 'layout_demo.dart';

void main() => runApp(MyApp()); // вызов класса MyApp на старте

//ma
class MyApp extends StatelessWidget {
  // без сохранения состояния
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Layout Demo',
      home: LayoutDemo(),
    );
  }
}
