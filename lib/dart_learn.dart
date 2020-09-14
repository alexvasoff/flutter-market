void main() {
  collections();
}

void baseTypes() {
  int figure1 = 1;
  var figure2 = 2; // сам определяет тип
  num figure3 = 3; // int || double

  print(figure1.toString() + " " + figure1.runtimeType.toString());
  print(figure2.toString() + " " + figure2.runtimeType.toString());
  print(figure3.toString() + " " + figure3.runtimeType.toString());

  String str = "This is string...";
  print("${str.length} and $figure1"); // интерполироваине {для методов}

  // преобразование типов
  String toInt = "2";
  print(2 == int.parse(toInt)); // также и с даблом
  print(3.14159.toStringAsFixed(2) == "3.14");
}

void functions() {
  void printValue(int value) {
    print(value);
    print("Написал!");
  }

  printValue(123);

  List<int> list = [7, 8, 9];
  print("\nФорич:");
  list.forEach(printValue);

  list.forEach((element) {
    // через анонимную ф-ю
    print(element);
    //printValue(element);
  });

  list.forEach((element) => print(element));

  var toUp = (value) => "${value.toUpperCase()}";
  print(toUp("asd"));

  // ф-я с Именованными параметрами (параметры оборачиваются в {} ):
  String getModel({String title, int value}) {
    return "$title is ${value * 2}";
  }

  print(getModel(title: "Именованный параметр", value: 5));

  // Ф-я с Позиционными параметрами
  String sayHello(String name, String msg, [String ps = "How are you?"]) {
    String res = "Hello, dear $name! $msg ";
    if (ps != null) res += ps;
    return res;
  }

  print(sayHello("Alex", "123", null));

  // Параметры по умолчанию
  String trueName({String name = "Alex", bool correct = false}) {
    return correct ? name : "Не верное имя!";
  }

  print(trueName());
}

// Замыкание
void closures() {
  Function addFunction(num add) {
    return (num i) => add + i;
  }

  var add2 = addFunction(2);
  Function add4 = addFunction(4);

  print(add2(2));
  print(add4(2));
}

// Коллекции
void collections() {
  // List - массив
  List<int> myIntList = [0, 1, 2, 3];
  var list = [4, 12, 5];
  print("Исходный массив myList $myIntList");
  myIntList.add(-5);
  print("Добавили -5 в лист. $myIntList");
  myIntList[0] = 10;
  print("Change 1st element: $myIntList");
  myIntList.removeAt(0);
  print("Удалили 0 элемент: $myIntList");
  myIntList.remove(-5);
  print("Удаление элемение по значению: $myIntList");

  print("\n");
// spread оператор
  var list1 = [1, 2, 3];
  var list2 = [5, 10, ...list1];
  print(list2);
// nullable spread
  var nullableList;
  var list3 = [1, ...?nullableList];
  print(list3);

  bool permission = true;
  var nav = ["home", "about", if (permission) "admin"];
  print(nav);

  List<int> intList = [1, 3, 5, 7, 2, 5];
  List<String> strList = [for(var i in intList) ">$i"];
  List<int> generator = [for (int i = 0; i<10; i++) i];
  print(strList);
  print(generator);
}
