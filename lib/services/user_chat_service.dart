// data_service.dart

import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:whatsapp_clone/models/user_model.dart';

Future<List<UserModel>> fetchUserData() async {
  try {
    String jsonData =
        await rootBundle.loadString('assets/dummy-data/user_chats.json');
    final parsed = jsonDecode(jsonData).cast<Map<String, dynamic>>();
    return parsed.map<UserModel>((json) => UserModel.fromJson(json)).toList();
  } catch (e) {
    print('Error loading JSON data: $e');
    throw Exception('Failed to load JSON data');
  }
}
