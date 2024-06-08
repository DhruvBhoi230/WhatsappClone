import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:whatsapp_clone/models/user_model.dart';
import 'package:whatsapp_clone/services/user_chat_service.dart';

class Chatswidget extends StatefulWidget {
  @override
  _ChatswidgetState createState() => _ChatswidgetState();
}

class _ChatswidgetState extends State<Chatswidget> {
  Future<List<UserModel>>? _fetchDataFuture;

  @override
  void initState() {
    super.initState();
    _fetchDataFuture = fetchUserData()
        as Future<List<UserModel>>?; // Call the data fetching method
  }

  // Future<List<dynamic>> _fetchData() async {
  //   // Replace with your actual JSON data source (file path or API endpoint)
  //   final jsonString = await rootBundle.loadString('assets/data.json');
  //   final data = json.decode(jsonString) as List<dynamic>;
  //   return data;
  // }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
        child: Column(
          children: [
            FutureBuilder<List<UserModel>>(
              future: _fetchDataFuture,
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  // ignore: avoid_print
                  print(snapshot.error);
                  return Text('Error: ${snapshot.error}');
                }

                if (!snapshot.hasData) {
                  return Center(child: CircularProgressIndicator());
                }

                final chatData = snapshot.data!;

                return ListView.builder(
                  shrinkWrap: true, // Prevent excessive scrolling
                  physics:
                      const NeverScrollableScrollPhysics(), // Disable scrolling
                  itemCount: chatData.length,
                  itemBuilder: (context, index) {
                    // ignore: avoid_print
                    // print(chatData);
                    // ignore: unused_local_variable
                    final chatItem = chatData[index];
                    // ignore: avoid_print
                    print(chatItem);
                    return InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, "Chatpage");
                      },
                      child: Container(
                        margin: const EdgeInsets.symmetric(vertical: 12),
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                            // child: Row(
                            //   children: [
                            //     ClipRRect(
                            //       borderRadius: BorderRadius.circular(40),
                            //       child: Image.asset(
                            //         chatItem['username'],
                            //         height: 65,
                            //         width: 65,
                            //         fit: BoxFit.cover,
                            //       ),
                            //     ),
                            //     Padding(
                            //       padding: const EdgeInsets.only(left: 20),
                            //       child: Column(
                            //         crossAxisAlignment: CrossAxisAlignment.start,
                            //         children: [
                            //           Text(
                            //             chatItem['username'],
                            //             style: TextStyle(
                            //                 fontSize: 19,
                            //                 fontWeight: FontWeight.bold),
                            //           ),
                            //           SizedBox(
                            //             height: 8,
                            //           ),
                            //           Text(
                            //             chatItem['lastmessage'],
                            //             style: TextStyle(
                            //                 fontSize: 16,
                            //                 fontWeight: FontWeight.w500,
                            //                 color: Colors.black),
                            //           ),
                            //         ],
                            //       ),
                            //     ),
                            //     Column(
                            //       children: [
                            //         Text(
                            //           chatItem['lastmessage'].toString(),
                            //           style: TextStyle(
                            //               fontSize: 14,
                            //               color: Color(0xff0fce5e),
                            //               fontWeight: FontWeight.w500),
                            //         ),
                            //         SizedBox(
                            //           height: 6,
                            //         ),
                            //         Container(
                            //           alignment: Alignment.center,
                            //           width: 27,
                            //           height: 27,
                            //           decoration: BoxDecoration(
                            //             color: Color(0xff0fce5e),
                            //             borderRadius: BorderRadius.circular(18),
                            //           ),
                            //           child: Text(
                            //             chatItem['unreadmessages'].toString(),
                            //             style: TextStyle(
                            //                 fontWeight: FontWeight.w500,
                            //                 color: Colors.black),
                            //           ),
                            //         )
                            //       ],
                            //     )
                            //   ],
                            // ),
                            ),
                      ),
                    );
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
