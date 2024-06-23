import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Callswidgets extends StatelessWidget {
  final String searchQuery;
  const Callswidgets({super.key, required this.searchQuery});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          for (int i = 1; i < 5; i++)
            Container(
              margin: EdgeInsets.symmetric(vertical: 10),
              child: Row(
                children: [
                  ClipRRect(
                      borderRadius: BorderRadius.circular(40),
                      child: Image.asset(
                        "assets/images/profile $i.jpg", 
                        width: 60,
                        height: 60,
                        fit: BoxFit.cover,
                      )),
                  Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "CODER",
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              height: 8,
                            ),
                            Row(
                              children: [
                                Icon(
                                  Icons.call_received,
                                  color: Colors.red,
                                  size: 19,
                                ),
                                Text(
                                  "(1) Today, 10.30",
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black54),
                                )
                              ],
                            )
                          ])),
                  Spacer(),
                  Container(
                    child: Icon(
                      Icons.call_sharp,
                      color: Color(0xff075e55),
                    ),
                  )
                ],
              ),
            ),
          for (int i = 5; i < 9; i++)
            Container(
              margin: EdgeInsets.symmetric(vertical: 10),
              child: Row(
                children: [
                  ClipRRect(
                      borderRadius: BorderRadius.circular(40),
                      child: Image.asset(
                        "assets/images/profile $i.jpg",
                        width: 60,
                        height: 60,
                        fit: BoxFit.cover,
                      )),
                  Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "PROGRAMER",
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              height: 8,
                            ),
                            Row(
                              children: [
                                Icon(
                                  Icons.call_made,
                                  color: Color(0xff075e55),
                                  size: 19,
                                ),
                                Text(
                                  "(1) Today, 11.30",
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black54),
                                )
                              ],
                            )
                          ])),
                  Spacer(),
                  Container(
                    child: Icon(
                      CupertinoIcons.videocam_fill,
                      color: Color(0xff075e55),
                      size: 29,
                    ),
                  )
                ],
              ),
            )
        ],
      ),
    );
  }
}
