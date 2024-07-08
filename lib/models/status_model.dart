class StatusModel {
  // static fromjson(json) {}
  final String username;
  final String image;
  final String isread;
  final String text;
  final String backgroundcolor;
  final String timestamp;

  StatusModel({
    required this.username,
    required this.image,
    required this.isread,
    required this.text,
    required this.backgroundcolor,
    required this.timestamp,
  });

  factory StatusModel.fromJson(Map<String, dynamic> jsonData) {
    return StatusModel(
      username: jsonData['username'],
      image: jsonData['image'],
      isread: jsonData['isread'],
      text: jsonData['text'],
      backgroundcolor: jsonData['backgroundcolor'],
      timestamp: jsonData['timestamp'],
    );
  }
}
