import 'dart:collection';

import 'package:flutter/foundation.dart';

class Item {
  final String name;
  final String description;
  num price;
  final String img;

  Item(
      {@required this.name,
      @required this.description,
      @required this.price,
      @required this.img});
}

class ItemsStorage {
  List<Item> _items = [
    Item(
        name: "Container",
        description:
            "Удобный виджет, сочетающий в себе стандартные виджеты рисования, позиционирования и изменения размера.",
        price: 10,
        img: "images/Container.png"),
    Item(
        name: "ListView",
        description: "Прокручиваемый список виджетов, расположенных линейно.",
        price: 10,
        img: "images/ListView.png"),
    Item(
        name: "ListTile",
        description:
            "Одна строка с фиксированной высотой, которая содержит текст, подзаголовок , а также начальный или конечный значок.",
        price: 10,
        img: "images/ListTile.png"),
    Item(
        name: "Flexible",
        description:
            "Виджет, управляющий тем, как изгибается дочерний элемент Row, Column или Flex. Использование Flexible виджета дает дочернему элементу Row, Column или Flex элемента гибкость для расширения, чтобы заполнить доступное пространство на главной оси (например, по горизонтали для строки или по вертикали для столбца), но, в отличие от Expanded, Flexible не требует, чтобы ребенок заполнил доступное пространство.",
        price: 10,
        img: "images/Flexible.png"),
    Item(
        name: "Expanded",
        description:
            "Виджет, расширяющий дочерний элемент Row, Column или Flex, чтобы дочерний элемент заполнил доступное пространство. При использовании расширенного виджета дочерний элемент Row, Column или Flex расширяется, чтобы заполнить доступное пространство вдоль главной оси (например, по горизонтали для строки или по вертикали для столбца)",
        price: 10,
        img: "images/Expanded.png"),
    Item(
        name: "SafeArea",
        description:
            "Виджет вставляет дочерний элемент таким образом, чтобы он не перекрывался Системной информацией (часы, уровень заряда и т.д.)",
        price: 10,
        img: "images/SafeArea.png"),
    Item(
        name: "Spacer",
        description:
            "Spacer создает регулируемый пустой разделитель, который можно использовать для настройки расстояния между виджетами в контейнере Flex, например в Row или Column.",
        price: 10,
        img: "images/Spacer.png"),
    Item(
        name: "Opacity",
        description:
            "Данный виджет делает свой дочерний элемент полупрозрачным",
        price: 10,
        img: "images/Opacity.png"),
    Item(
        name: "Draggable",
        description:
            "Виджет, который можно перетащить на DragTarget. Когда перетаскиваемый виджет распознает начало жеста перетаскивания, он отображает виджет обратной связи, который отслеживает палец пользователя по экрану. Если пользователь поднимает палец, находясь над DragTarget, этой цели предоставляется возможность принять данные, переносимые перетаскиваемым объектом.",
        price: 10,
        img: "images/Draggable.png"),
    Item(
        name: "SizedBox",
        description:
            "Коробка заданного размера. Если указан дочерний элемент, этот виджет заставляет его дочерний элемент иметь определенную ширину и / или высоту (при условии, что значения разрешены родительским элементом этого виджета). Если ширина или высота равна нулю, этот виджет попытается изменить свой размер, чтобы он соответствовал размеру дочернего элемента в этом измерении. Если размер дочернего элемента зависит от размера его родительского элемента, необходимо указать высоту и ширину.",
        price: 10,
        img: "images/SizedBox.png"),
    Item(
        name: "Stack",
        description:
            "Виджет, который размещает своих дочерних элементов относительно краев своего блока",
        price: 10,
        img: "images/Stack.png"),
    Item(
        name: "Table",
        description:
            "Виджет, использующий алгоритм компоновки таблицы для своих дочерних элементов.",
        price: 10,
        img: "images/Table.png"),
    Item(
        name: "Wrap",
        description:
            "Виджет, который отображает своих дочерних элементов в нескольких горизонтальных или вертикальных прогонах.",
        price: 10,
        img: "images/Wrap.png"),
  ];

  UnmodifiableListView<Item> get items => UnmodifiableListView(_items);
}
