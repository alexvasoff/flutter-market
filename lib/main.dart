import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

void main() => runApp(MyApp());  // вызов класса MyApp на старте

//ma
class MyApp extends StatelessWidget { // без сохранения состояния
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Startup Name Generator',
      home: RandomWords(),
    );
  }
}

// stful
class RandomWords extends StatefulWidget {
  @override
  _RandomWordsState createState() => _RandomWordsState();
}

class _RandomWordsState extends State<RandomWords> {
  final _suggestion = <WordPair>[];  // массив для хранения слов
  final _biggerFont = TextStyle(fontSize: 18.0);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Генератор Названий"),
      ),
      body: _buildSuggestions(),
    );
  }

  Widget _buildSuggestions() {
    return ListView.builder(
      padding: EdgeInsets.all(16.0),
      itemBuilder: (context, i) {
        if (i.isOdd) return Divider();  // если нечет - создание разделителя

        final index = i ~/ 2;
        if (index >= _suggestion.length) {
          _suggestion.addAll(generateWordPairs().take(10));
        }
        return _buildRow(_suggestion[index], index);
      },
    );
  }

  Widget _buildRow(WordPair pair, int number) {
    return ListTile(
      title: Text(
        pair.asPascalCase,
        style: _biggerFont,
      ),
      trailing: Icon(Icons.favorite_border),  // иконка в конце  списка
      subtitle: Text("Нравится?") ,
      leading: Text(number.toString()),

    );
  }

}

