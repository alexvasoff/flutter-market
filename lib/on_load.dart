import 'test.dart';

class OnLoad {
  static void start() {
    List<Item> items = ItemsStorage.getInstance().items;
  }
}
