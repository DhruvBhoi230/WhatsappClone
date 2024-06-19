import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:whatsapp_clone/models/status_model.dart';
import 'package:whatsapp_clone/services/Status.parser.dart';

class Statuswidgets extends StatefulWidget {
  const Statuswidgets({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _Statuswidgets createState() => _Statuswidgets();
}

class _Statuswidgets extends State<Statuswidgets> {
  List<StatusModel> _futureStatusData = [];

  @override
  void initState() {
    super.initState();
    _fetchData();
  }

  Future<void> _fetchData() async {
    try {
      List<StatusModel> persons = await parseStatuss();
      setState(() {
        _futureStatusData = persons;
      });
    } catch (e) {
      print('Error loading data: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Container(
                margin: EdgeInsets.symmetric(vertical: 12),
                child: Row(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(40),
                          border: Border.all(color: Colors.blue, width: 3)),
                      padding: EdgeInsets.all(0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(40),
                        child: Image.asset(
                          "assets/images/profile 1.jpg",
                          height: 55,
                          width: 55,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "My Status",
                            style: TextStyle(
                                fontSize: 17, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 7.0,
                          ),
                          Text(
                            "Today, 09.40",
                            style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w500,
                                color: Colors.black54),
                          )
                        ],
                      ),
                    ),
                    Spacer(),
                    Container(
                      child: Icon(Icons.more_vert, color: Color(0xff075e55)),
                    )
                  ],
                ),
              ),
              Container(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Viewed Update",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: Colors.black.withOpacity(0.6)),
                ),
              ),
              Column(children: [
                FutureBuilder<List<StatusModel>>(
                    future: parseStatuss(),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        List<StatusModel> users = snapshot.data!;
                        return Container(
                          height: 1000, // Set a fixed height
                          child: ListView.builder(
                              itemCount: users.length,
                              itemBuilder: (context, index) {
                                final person = _futureStatusData[index];
                                return Row(
                                  children: [
                                    Container(
                                      padding: EdgeInsets.all(1.5),
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(40),
                                          border: Border.all(
                                              color: Colors.grey, width: 3)),
                                      child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(40),
                                          child: Image.asset(
                                            "assets/images/profile ${index + 1}.jpg",
                                            height: 55,
                                            width: 55,
                                            fit: BoxFit.cover,
                                          )),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(left: 20),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "Ealisa",
                                            style: TextStyle(
                                              fontSize: 17,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          SizedBox(
                                            height: 7,
                                          ),
                                          Text(
                                            "10.30",
                                            style: TextStyle(
                                                fontSize: 15,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.black54),
                                          )
                                        ],
                                      ),
                                    ),
                                  ],
                                );
                              }),
                        );
                      } else {
                        return Text('Error');
                      }
                    })
              ])
            ])));
  }
}
