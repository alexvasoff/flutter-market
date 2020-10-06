import '../models/item_model.dart';

//TODO: слеать нормальный класс с полями и методами (статик)
class Cart {
  Cart._internal();

  static Cart _itemsStorage = Cart._internal();

  static Cart getInstance() => _itemsStorage;

  static Map<Item, int> _itemsInCart = new Map<Item, int>();

  List<Item> get getAllItems => _itemsInCart.keys.toList();
  void addItemToMap(Item item) => _itemsInCart.addAll({item: 1});
}
