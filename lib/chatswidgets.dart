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
  List<UserModel> _fetchDataFuture = [];

  @override
  void initState() {
    super.initState();
    _fetchData(); // Call the data fetching method
  }

  Future<void> _fetchData() async {
    try {
      List<UserModel> data = await fetchUserData();
      setState(() {
        _fetchDataFuture = data;
      });
    } catch (e) {
      // ignore: avoid_print
      print('Error loading data: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
        child: Column(
          children: [
            FutureBuilder<List<UserModel>>(
              future: fetchUserData(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  List<UserModel> users = snapshot.data!;
                  return ListView.builder(
                    itemCount: users.length,
                    itemBuilder: (context, index) {
                      final user = _fetchDataFuture[index];
                      return Text(index.toString());
                    },
                  );
                } else if (snapshot.hasError) {
                  return const Center(
                    child: Text('Error loading data'),
                  );
                } else {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
              },
            ),
            InkWell(
              onTap: () {
                Navigator.pushNamed(context, "Chatpage");
              },
              child: Container(
                margin: const EdgeInsets.symmetric(vertical: 12),
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  child: Row(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(40),
                        child: Image.asset(
                          "assets/images/profile 1.jpg",
                          height: 65,
                          width: 65,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Flutter Example",
                                style: TextStyle(
                                    fontSize: 19, fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                height: 8,
                              ),
                              Text(
                                " Hey!! i am devied",
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black),
                              ),
                            ]),
                      ),
                      Column(
                        children: [
                          Text(
                            "10.00",
                            style: TextStyle(
                                fontSize: 14,
                                color: Color(0xff0fce5e),
                                fontWeight: FontWeight.w500),
                          ),
                          SizedBox(
                            height: 6,
                          ),
                          Container(
                            alignment: Alignment.center,
                            width: 27,
                            height: 27,
                            decoration: BoxDecoration(
                              color: Color(0xff0fce5e),
                              borderRadius: BorderRadius.circular(18),
                            ),
                            child: Text(
                              "2",
                              style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black),
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
