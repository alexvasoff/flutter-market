// import 'package:flutter/services.dart';
// import 'package:flutter/services.dart' show rootBundle;
// import 'dart:async' show Future;
// import 'package:flutter/material.dart';
//
// void main() => runApp(new MaterialApp(home: Scaffold(body: MyApp())));
//
// class MyApp extends StatefulWidget {
//   @override
//   _MyAppState createState() => _MyAppState();
// }
//
// class _MyAppState extends State<MyApp> {
//   Parser mParser = Parser();
//   @override
//   Widget build(BuildContext context) {
//     return Container();
//   }
//
//   @override
//   void initState() async {
//     super.initState();
//     print('${await mParser.getJson()}');
//   }
// }
//
// class Parser {
//   Future<String> _getJsonFile() async {
//     return await rootBundle.loadString('assets/ItemData.json');
//   }
//
//   Future<String> getJson() async {
//     return await getJson();
//   }
//
//   void show() async {
//     print('${await getJson()}');
//   }
// }
