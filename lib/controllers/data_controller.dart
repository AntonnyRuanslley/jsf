import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;

class DataController {
  static Future<Map<String, dynamic>> loadAsset(String fileName) async {
    try {
      final fileData = await rootBundle.loadString('assets/data/$fileName');
      return jsonDecode(fileData);
    } catch (e) {
      print(e);
      return {};
    }
  }
}
