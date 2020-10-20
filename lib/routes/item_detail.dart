import 'package:flutter/material.dart';
import 'package:flutter_learn/database.dart';
import 'package:flutter_learn/models/item_model.dart';
import 'package:flutter_learn/storage/cart_storage.dart';

class ItemDetail extends StatefulWidget {
  final Item curItem;
  final String title;

  const ItemDetail({Key key, this.curItem, this.title}) : super(key: key);

  @override
  _ItemDetailState createState() => _ItemDetailState(curItem, title);
}

class _ItemDetailState extends State<ItemDetail> {
  final Item curItem;
  final String title;

  _ItemDetailState(this.curItem, this.title);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Widget: $title'),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(10),
          child: Column(
            children: [
              imageSection(),
              titleSection(),
              addToCartButton(),
              descriptionSection(),
              SizedBox(height: 12),
              homeButton(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget imageSection() {
    return Container(
      margin: EdgeInsets.all(10),
      width: 360,
      height: 225,
      child: Image.asset(
        '${curItem.img}',
        fit: BoxFit.cover,
      ),
    );
  }

  Widget titleSection() {
    return Container(
      margin: EdgeInsets.only(top: 20, left: 10),
      child: Row(
        children: [
          Expanded(
            child: Text(
              "Название: ${curItem.name}",
              style: TextStyle(fontSize: 18),
              softWrap: true,
            ),
          ),
          Container(
            child: Text(
              "Цена: ${curItem.price}",
              style: TextStyle(fontSize: 18),
            ),
          ),
          FavoriteWidget(curItem),
        ],
      ),
    );
  }

  Widget addToCartButton() {
    var _enable;
    if (!Cart.getInstance().isInCart(curItem.id)) {
      _enable = () {
        setState(() {
          Cart.getInstance().addItem(curItem);
        });
      };
    }
    return Container(
      margin: EdgeInsets.only(top: 16),
      child: FlatButton(
        padding: EdgeInsets.all(10),
        color: Colors.blue,
        disabledColor: Colors.grey,
        onPressed: _enable,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Добавить в корзину',
              style: TextStyle(fontSize: 18, color: Colors.white),
            ),
            SizedBox(
              width: 10,
            ),
            Icon(
              Icons.add_shopping_cart,
              color: Colors.white,
            )
          ],
        ),
      ),
    );
  }

  Widget descriptionSection() {
    return Container(
      margin: EdgeInsets.only(top: 10, left: 10),
      alignment: Alignment.bottomLeft,
      child: Text(
        "${curItem.description}",
        style: TextStyle(
          fontSize: 18,
        ),
        softWrap: true,
      ),
    );
  }

  Widget homeButton(context) {
    return FlatButton(
      color: Colors.blue,
      textColor: Colors.white,
      padding: EdgeInsets.all(12.0),
      child: SizedBox(
        width: 240,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.reply),
            SizedBox(
              width: 18,
            ),
            Text(
              "Вернуться назад",
              style: TextStyle(fontSize: 16),
            )
          ],
        ),
      ),
      onPressed: () => Navigator.pop(context),
    );
  }
}

class FavoriteWidget extends StatefulWidget {
  final Item curItem;
  FavoriteWidget(this.curItem);

  @override
  _FavoriteWidgetState createState() => _FavoriteWidgetState(curItem);
}

class _FavoriteWidgetState extends State<FavoriteWidget> {
  Item curItem;
  _FavoriteWidgetState(this.curItem);

  bool _isFavorited;
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: FavoriteDB.db
          .findItemInDB(curItem)
          .then((value) => _isFavorited = value),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return Row(
            children: [
              IconButton(
                icon: (_isFavorited
                    ? Icon(Icons.favorite)
                    : Icon(Icons.favorite_border)),
                color: Colors.red,
                onPressed: _toggleFavorite,
              ),
            ],
          );
        }
        return Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }

  void _toggleFavorite() {
    setState(() {
      if (_isFavorited) {
        FavoriteDB.db.deleteItemFromDB(curItem);
      } else {
        FavoriteDB.db.addItemToDB(curItem);
      }
      _isFavorited = !_isFavorited;
    });
  }
}
