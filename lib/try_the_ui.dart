import 'package:flutter/material.dart';

class RowColumn extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.blueGrey,
        child: Row(
          mainAxisSize: MainAxisSize.max, // min - ужимается до детей
          mainAxisAlignment: MainAxisAlignment.spaceEvenly, //  при MAS = max;
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [ColorBox(), ColorBox(), BiggerColorBox()],
        ));
  }
}

class ColorBox extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 80,
      height: 80,
      decoration: BoxDecoration(
        color: Colors.deepOrangeAccent,
        border: Border.all(),
      ),
    );
  }
}

class BiggerColorBox extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 80,
      height: 100,
      decoration: BoxDecoration(
        color: Colors.deepOrangeAccent,
        border: Border.all(),
      ),
    );
  }
}
