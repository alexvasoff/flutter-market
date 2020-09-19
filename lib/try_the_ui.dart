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

class MyContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        decoration: BoxDecoration(
          color: Colors.blue[100],
          border: Border.all(),
          shape: BoxShape.circle,
        ),
        // alignment: Alignment.center,
        // width: 150,
        // height: 150,
        margin: EdgeInsets.all(1),
        padding: EdgeInsets.fromLTRB(100, 4, 2, 6),
        child: Text("Text in container!"),
      ),
    );
  }
}

class ContWithImg extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: Image.network(
                  'https://im.jigsawplanet.com/?rc=img&pid=22c354cf3317&size=160')
              .image,
        ),
      ),
    );
  }
}
