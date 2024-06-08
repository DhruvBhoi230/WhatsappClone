// data_service.dart

import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:whatsapp_clone/models/user_model.dart';

Future<List<UserModel>> fetchUserData() async {
  // Simulate a network delay
  await Future.delayed(Duration(seconds: 2));

  // Normally, you'd fetch data from an API, but for this example, we'll use local JSON
  String jsonString =
      await rootBundle.loadString('assets/dummy-data/user_chats.json');
  // Map<String, dynamic> jsonResponse = json.decode(jsonString);
  // final parsed = jsonDecode(jsonString).cast<Map<String, dynamic>>();
  List<dynamic> jsonResponse = json.decode(jsonString);
  // return parsed.map<UserModel>((json) => UserModel.fromJson(json).toJson());
  return jsonResponse.map((json) => UserModel.fromJson(json)).toList();
}
