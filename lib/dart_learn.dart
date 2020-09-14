void main() {
  functions();
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

  list.forEach((element) {  // через анонимную ф-ю
    print(element);
    //printValue(element);
  });

  list.forEach((element) => print(element));
  
  var toUp = (value) => "${value.toUpperCase()}";
  print(toUp("asd"));

  // ф-я с Именованными параметрами (параметры оборачиваются в {} ):
  String getModel({String title, int value})
  {
    return "$title is ${value*2}";
  }
  print( getModel(title: "Именованный параметр", value: 5) );

  // Ф-я с Позиционными параметрами
  String sayHello(String name, String msg, [String ps]) {
    String res = "Hello, dear $name! ";
    if (ps != null) res += ps;
    return res;
  }

  print(sayHello("Alex", "123", "1222"));


}
