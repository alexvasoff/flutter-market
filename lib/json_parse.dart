import 'dart:async';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

class JsonStorage {
  Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();

    return directory.path;
  }

  Future<File> get _localFile async {
    final path = await _localPath;
    return File('$path/ItemData.json');
  }

  Future<String> readJson() async {
    try {
      final file = await _localFile;

      // Read the file
      String contents = await file.readAsString();

      return contents;
    } catch (e) {
      print("НЕ НАШЕЛ!!!!!!!");
      // If encountering an error, return 0
      return '';
    }
  }
}

class GetJson {
  final JsonStorage json = JsonStorage();

  String getJson() {
    json.readJson().then((value) {
      return value;
    });
  }
}
