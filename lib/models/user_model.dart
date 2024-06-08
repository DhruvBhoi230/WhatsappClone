// user_model.dart

import 'dart:convert';

class UserModel {
  final String username;
  final String timestamp;
  final String lastmessage;
  final String unreadmessages;

  UserModel(
      {required this.username,
      required this.timestamp,
      required this.lastmessage,
      required this.unreadmessages});

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      username: json['username'],
      timestamp: json['timestamp'],
      lastmessage: json['lastmessage'],
      unreadmessages: json['unreadmessages'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      username: json,
      timestamp: timestamp,
      lastmessage: lastmessage,
      unreadmessages: unreadmessages,
    };
  }
}
