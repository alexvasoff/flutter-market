import '../models/item_model.dart';

class Cart {
  Cart._internal();

  static Cart _itemsStorage = Cart._internal();

  static Cart getInstance() => _itemsStorage;

  static Map<Item, int> _itemsInCart = new Map<Item, int>();
  Map<Item, int> get getMap => _itemsInCart;
  List<Item> get getAllItems => _itemsInCart.keys.toList();
  void addItemToMap(Item item) => _itemsInCart.addAll({item: 1});
  int totalPrice() {
    int totalPrice = 0;
    _itemsInCart.forEach((key, value) {
      totalPrice += value * key.price;
    });
    return totalPrice;
  }

  int totalCount() {
    int totalCount = 0;
    _itemsInCart.forEach((key, value) {
      totalCount += value;
    });
    return totalCount;
  }
}
