import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

void main() => runApp(MyApp()); // вызов класса MyApp на старте

//ma
class MyApp extends StatelessWidget {
  // без сохранения состояния
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
  final _suggestion = <WordPair>[]; // массив для хранения слов
  final _biggerFont = TextStyle(fontSize: 18.0);
  final _saved = Set<WordPair>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //панель приложения по умолчанию
      appBar: AppBar(
        title: Text(
          "Генератор Названий",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.blue,
      ),
      body: _buildSuggestions(),
    );
  }

  Widget _buildSuggestions() {
    return ListView.builder(
      padding: EdgeInsets.all(16.0),
      itemBuilder: (context, i) {
        if (i.isOdd)
          return Divider(height: 16.0); // если нечет - создание разделителя

        final index = i ~/ 2;
        if (index >= _suggestion.length) {
          _suggestion.addAll(generateWordPairs()
              .take(10)); // добавить 10 сгенеренных пар в лист
        }
        return _buildRow(_suggestion[index], index);
      },
    );
  }

  Widget _buildRow(WordPair pair, int number) {
    final bool alreadySaved = _saved.contains(pair);
    return ListTile(
      title: Text(
        pair.asPascalCase,
        style: _biggerFont,
      ),
      trailing: Icon(
        alreadySaved ? Icons.favorite : Icons.favorite_border,
        color: alreadySaved ? Colors.red : null,
      ), // иконка в конце списка
      subtitle: Text("subText"),
      leading: Text(
        number.toString(),
        style: TextStyle(fontSize: 21),
      ),
      onTap: () {
        setState(() {  //запускает билд объекта
          if (alreadySaved) {
            _saved.remove(pair);
          }
          else {
            _saved.add(pair);
          }
        });
      },
    );
  }
}
