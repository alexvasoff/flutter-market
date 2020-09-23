import 'package:flutter/material.dart';
import 'package:flutter_learn/random_word.dart';
import 'package:flutter_learn/tutorial_home.dart';

void main() => runApp(MyApp()); // вызов класса MyApp на старте

//ma
class MyApp extends StatelessWidget {
  // без сохранения состояния
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Layout Demo',
      home: Scaffold(
          appBar: AppBar(title: Text("Flutter Layout Demo")),
          body: ListView(
            children: [
              imageSection(),
              titleSection(),
              buttonSection(),
              textSection(),
            ],
          )),
    );
  }

  Widget titleSection() {
    return Container(
      padding: const EdgeInsets.all(32),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: Text(
                    "Oeschinen Lake Campground",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                Text(
                  "Kandersteg, Switzerland",
                  style: TextStyle(color: Colors.grey[500]),
                )
              ],
            ),
          ),
          FavoriteWidget(),
        ],
      ),
    );
  }

  Widget _buildButtonColumn(IconData icon, Color color, String text) {
    return Column(
      children: [
        Icon(
          icon,
          color: color,
        ),
        Container(
          margin: const EdgeInsets.only(top: 8),
          child: Text(
            text,
            style: TextStyle(
                color: color, fontWeight: FontWeight.w400, fontSize: 12),
          ),
        ),
      ],
    );
  }

  Widget buttonSection() {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _buildButtonColumn(Icons.phone, Colors.blue, "CALL"),
          _buildButtonColumn(Icons.near_me, Colors.blue, "ROUT"),
          _buildButtonColumn(Icons.share, Colors.blue, "SHARE"),
        ],
      ),
    );
  }

  Widget textSection() {
    return Container(
      margin: const EdgeInsets.all(32),
      child: Text(
        'Lake Oeschinen lies at the foot of the Blüemlisalp in the Bernese '
        'Alps. Situated 1,578 meters above sea level, it is one of the '
        'larger Alpine Lakes. A gondola ride from Kandersteg, followed by a '
        'half-hour walk through pastures and pine forest, leads you to the '
        'lake, which warms to 20 degrees Celsius in the summer. Activities '
        'enjoyed here include rowing, and riding the summer toboggan run.',
        softWrap: true,
      ),
    );
  }

  Widget imageSection() {
    return Image.network(
      'https://besthqwallpapers.com/Uploads/18-5-2017/15726/thumb2-mountain-lake-spring-svitzerland-bernese-alps-oeschinen-lake.jpg',
      height: 240,
      fit: BoxFit.cover,
    );
  }
}

class FavoriteWidget extends StatefulWidget {
  @override
  _FavoriteWidgetState createState() => _FavoriteWidgetState();
}

class _FavoriteWidgetState extends State<FavoriteWidget> {
  bool _isFavorited = true;
  int _favoriteCount = 41;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          icon: (_isFavorited
              ? Icon(Icons.favorite)
              : Icon(Icons.favorite_border)),
          color: Colors.red,
          onPressed: _toggleFavorite,
        ),
        SizedBox(
          width: 18,
          child: Container(
            child: Text('$_favoriteCount'),
          ),
        )
      ],
    );
  }

  void _toggleFavorite() {
    setState(() {
      if (_isFavorited) {
        _favoriteCount -= 1;
        _isFavorited = false;
      } else {
        _favoriteCount += 1;
        _isFavorited = true;
      }
    });
  }
}
