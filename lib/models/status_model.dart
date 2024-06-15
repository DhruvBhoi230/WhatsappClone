class StatusModel{
  // static fromjson(json) {}
final String image;
final String isread;
final String text;
final String backgroundcolor;
final String timestamp;
 

 StatusModel(
  {required this.image,
  required this.isread,
  required this.text,
  required this.backgroundcolor,
  required this.timestamp,});
  

  factory StatusModel.fromJson(Map<String, dynamic> jsonData){
    return StatusModel(
      image: jsonData['image'], 
      isread: jsonData['isread'], 
      text:  jsonData['text'], 
      backgroundcolor:jsonData['backgroundcolor'], 
      timestamp: jsonData ['timestamp'],
      );
  }
}