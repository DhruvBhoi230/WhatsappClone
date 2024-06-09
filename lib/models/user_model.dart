class UserModel {
  final String username;
  final String timestamp;
  final String lastMessage;
  final String unreadMessages;

  UserModel(
      {required this.username,
      required this.timestamp,
      required this.lastMessage,
      required this.unreadMessages});

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      username: json['username'],
      timestamp: json['timestamp'],
      lastMessage: json['lastMessage'],
      unreadMessages: json['unreadMessages'],
    );
  }
}
