import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;
import 'package:whatsapp_clone/models/person_model.dart';

Future<List<Person>> parsePersons() async {
  try {
    String jsonData =
        await rootBundle.loadString('assets/dummy-data/person_list_data.json');
    final parsed = jsonDecode(jsonData).cast<Map<String, dynamic>>();
    return parsed.map<Person>((json) => Person.fromJson(json)).toList();
  } catch (e) {
    print('Error loading JSON data: $e');
    throw Exception('Failed to load JSON data');
  }
}
