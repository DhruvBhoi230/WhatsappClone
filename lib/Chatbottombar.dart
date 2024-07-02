import 'package:flutter/material.dart';

class Chatbottombar extends StatelessWidget {
  const Chatbottombar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 65,
      child: Row(
        children: [
          Container(
            margin: EdgeInsets.all(5.0),
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
            
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(30),
            ),
           
            child: Row(
              children: [
                
                Icon(
                
                  Icons.emoji_emotions,
                  color: Colors.black38,
                  size: 30,
                ),
                SizedBox(
                  width: 10,
                ),
                Container(
                  width: 170,
                  child: TextFormField(
                    style: TextStyle(fontSize: 19),
                    decoration: (InputDecoration(
                        hintText: "Message", border: InputBorder.none)),
                  ),
                ),
                Icon(
                  Icons.attachment_outlined,
                  color: Colors.black38,
                ),
                SizedBox(
                  width: 15,
                ),
                Icon(
                  Icons.currency_rupee_outlined,
                  color: Colors.black,
                ),
                SizedBox(
                  width: 10,
                ),
                Icon(
                  Icons.camera_alt,
                  size: 28,
                )
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(
                color: Color(0xff000887a),
                borderRadius: BorderRadius.circular(30)),
            child: Icon(
              Icons.mic,
              size: 30,
              color: Colors.white,
            ),
          )
        ],
      ),
    );
  }
}
