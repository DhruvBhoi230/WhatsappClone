import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:whatsapp_clone/models/calls_model.dart';
import 'package:whatsapp_clone/services/calls.parser.dart';

import 'package:flutter/material.dart';

class CallsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calls'),
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Recent Calls',
              style: Theme.of(context).textTheme.headlineLarge,
            ),
            SizedBox(height: 16.0),
            // Add calls list here
          ],
        ),
      ),
    );
  }
}


class Callswidgets extends StatefulWidget {
  final String searchQuery;
  Callswidgets({super.key, required this.searchQuery});

  @override
  // ignore: library_private_types_in_public_api
  _Callswidgets createState() => _Callswidgets ();
}

  class _Callswidgets extends State<Callswidgets> {
  List<Call> _futureCallData = [];
  TextEditingController _searchController = TextEditingController();
  List<Call> _fetchparsercalls = [];


  @override
  void initState() {
    super.initState();
    _fetchData();

    _searchController.addListener(() {
      filterUsers();
    });
  }


  void filterUsers() {
    final query = _searchController.text.toString();
    setState(() {
    _fetchparsercalls= _fetchparsercalls.where((data) {
        return (data.callerName.contains(query));
      }).toList();
    });
  }

   Future<void> _fetchData() async {
    try {
      List<Call> data = await parsercalls();
      setState(() {
        _fetchparsercalls = data; 
        _fetchparsercalls = data;
        // Initially, show all calls
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
                            "Calls",
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
                          ),
                          
                          
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
                  "",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: Colors.black.withOpacity(0.6)),
                ),
              ),
              
              Column(children: [
                FutureBuilder<List<Call>>(
              future: parsercalls(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  final filteredUsers =  _fetchparsercalls.where((user) {
                    return user.callerName
                        
                        .contains(widget.searchQuery.toLowerCase());
                  }).toList();
                  List<Call> users = snapshot.data!;
                  return Container(
                    height: 1000, // Set a fixed height
                    child: ListView.builder(
                        itemCount: filteredUsers.length,
                        itemBuilder: (context, index) {
                          final user = users[index];
                          return InkWell(
                            onTap: () {
                              Navigator.pushNamed(context, "Callspage");
                            },
                            child: Container(
                              margin: const EdgeInsets.symmetric(vertical: 12),
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(40),
                                          child: Image.asset(
                                            "assets/images/profile ${index + 1}.jpg",
                                            height: 65,
                                            width: 65,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                        // Padding(
                                        //   padding:
                                        //       const EdgeInsets.only(left: 20),
                                        //   child: Column(
                                        //       crossAxisAlignment:
                                        //           CrossAxisAlignment.start,
                                        //       children: [
                                        //         Text(
                                        //           user.username,
                                        //           style: TextStyle(
                                        //               fontSize: 19,
                                        //               fontWeight:
                                        //                   FontWeight.bold),
                                        //         ),
                                        //         SizedBox(
                                        //           height: 8,
                                        //         ),
                                        //         Text(
                                        //           user.lastMessage,
                                        //           style: TextStyle(
                                        //               fontSize: 16,
                                        //               fontWeight:
                                        //                   FontWeight.w500,
                                        //               color: Colors.black),
                                        //         ),
                                        //       ]),
                                        // ),
                                      ],
                                    ),
                                    // Column(
                                    //   children: [
                                    //     Text(
                                    //       user.timestamp,
                                    //       style: TextStyle(
                                    //           fontSize: 14,
                                    //           color: Color(0xff0fce5e),
                                    //           fontWeight: FontWeight.w500),
                                    //     ),
                                    //     SizedBox(
                                    //       height: 6,
                                    //     ),
                                    //     Container(
                                    //       alignment: Alignment.center,
                                    //       width: 27,
                                    //       height: 27,
                                    //       decoration: BoxDecoration(
                                    //         color: Color(0xff0fce5e),
                                    //         borderRadius:
                                    //             BorderRadius.circular(18),
                                    //       ),
                                    //       child: Text(
                                    //         user.timestamp,
                                    //         style: TextStyle(
                                    //             fontWeight: FontWeight.w500,
                                    //             color: Colors.black),
                                    //       ),
                                    //     ),
                                    //   ],
                                    //),
                                  ],
                                ),
                              ),
                            ),
                          );
                        }),
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
              ],
              ),
            ],
            ),
            ),
            );
  }

  }
