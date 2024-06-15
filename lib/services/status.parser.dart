import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;

import '../models/status_model.dart';

Future<List<StatusModel>> parseStatuss() async {
  try {
    String jsonData =
        await rootBundle.loadString('assets/dummy-data/status.json');
    final parsed = jsonDecode(jsonData).cast<Map<String, dynamic>>();
    return parsed.map<StatusModel>((json) => StatusModel.fromJson(json)).toList();
  } catch (e) {
    print('Error - status json: $e');
    throw Exception('Failed to load JSON data');
  }
}

