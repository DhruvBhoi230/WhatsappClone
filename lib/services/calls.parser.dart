import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;
import 'package:whatsapp_clone/models/calls_model.dart';

import '../models/status_model.dart';

Future<List<Call>> parsercalls() async {
  try {
    String jsonData =
        await rootBundle.loadString('assets/dummy-data/status.json');
    final parsed = jsonDecode(jsonData).cast<Map<String, dynamic>>();
    return parsed.map<Call>((json) => (json)).toList();
  } catch (e) {
    print('Error - status json: $e');
    throw Exception('Failed to load JSON data');
  }
}