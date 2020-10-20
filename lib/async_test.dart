main() {}

void runner() async {
  var a = await myTest(false);
  print(a);
}

Future<bool> myTest(bool vara) async {
  print("123");
  return await Future<bool>(() {
    print("1234");
    return !vara;
  }).then((value) {
    value;
    print(value);
  });
}

// -------------------------------------------------------------------------
fututre() {
  print('Перед Future');
  Future(() {
    print('Во Futer');
  });
  Future<int>(() {
    print('Во Futer2');
    return 5 + 2;
  }).then((res) => print(res));
  Future(() {
    print('Во Futer3');
  });
  print('После Future');
}

// -------------------------------------------------------------------------
asyncs() async {
  methodA();
  await methodB();
  await methodC('main');
  methodD();
}

methodA() {
  print('A');
}

methodB() async {
  print('B start');
  await methodC('B');
  print('B end');
}

methodC(String from) async {
  print('C start from $from');

  Future(() {
    // <== Этот код будет исполнен когда-то в будущем
    print('C running Future from $from');
  }).then((_) {
    print('C end of Future from $from');
  });

  print('C end from $from');
}

methodD() {
  print('D');
}

// -------------------------------------------------------------------------

void asyncs2() async {
  methodA2();
  methodB2();
  await methodC2('main');
  methodD2();
}

methodA2() {
  print('A');
}

methodB2() async {
  print('B start');
  await methodC2('B');
  print('B end');
}

methodC2(String from) async {
  print('C start from $from');

  await Future(() {
    // <== изменение здесь
    print('C running Future from $from');
  }).then((_) {
    print('C end of Future from $from');
  });
  print('C end from $from');
}

methodD2() {
  print('D');
}
