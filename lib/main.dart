import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

void main() => runApp(MyApp());  // вызов класса MyApp на старте

class MyApp extends StatelessWidget { // без сохранения состояния
  @override
  Widget build(BuildContext context) {
    final WordPair wordPair = WordPair.random();
    return MaterialApp(
      title: 'Material App',
      home: Scaffold(  // предоставляет панель, заголовок, свойство body
        appBar: AppBar(
          title: Text('Material App Bar'),
        ),
        body: Center(
          child: Container(
            child: Text(wordPair.asPascalCase),
          ),
        ),
      ),
    );
  }
}
