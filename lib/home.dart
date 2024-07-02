// ignore_for_file: prefer_const_constructors, unused_import
import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:flutter/semantics.dart';
import 'package:provider/provider.dart';
import 'package:whatsapp_clone/Callswidgets.dart';
import 'package:whatsapp_clone/Statuswidgets.dart';
import 'package:whatsapp_clone/SettingsPage.dart';
import 'package:whatsapp_clone/ThemeChangeNotifier.dart';
import 'package:whatsapp_clone/chatswidgets.dart';
import 'package:whatsapp_clone/person_list.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool showSearch = false;
  var _searchQuery = "";
  int _activeTabIndex = 0; // Properly declare and initialize _activeTabIndex

  void _updateSearchQuery(query) {
    setState(() {
      _searchQuery = query;
    });
  }

  void handleTabChange(value) {
    setState(() {
      showSearch = false;
      _activeTabIndex = value;
    });
  }

  void handleSearchIconPress() {
    setState(() {
      showSearch = !showSearch;
      // ignore: avoid_print
      print('Search Button Pressed');
    });
  }

  searchLabel() {
    if (_activeTabIndex == 2) {
      return 'Search Status';
    } else if (_activeTabIndex == 3) {
      return 'Search Call';
    }
    return 'Search Chat'; // Fixed typo
  }

  Widget _AppAndSearchBar(context) {
    var themeProvider = Provider.of<ThemeNotifier>(context);

    if (!showSearch) {
      return AppBar(
        elevation: 0,
        title: Text(
          'WhatsApp',
          style: Theme.of(context).textTheme.headlineLarge,
        ),
        actions: [
          // const Padding(
          //   padding: EdgeInsets.only(top: 12.0, right: 15),
          //   child:
          // ),
         
          Padding(
            padding: const EdgeInsets.all(12),
            child: IconButton(
                onPressed: handleSearchIconPress,
                icon: Icon(
                  Icons.search,
                  color: Colors.white,
                  size: 28,
                  // color: Colors.white,
                )),
          ),
          PopupMenuButton(
            onSelected: (value) {
              // if someone click on value number 5 mens click on settings
              // ignore: avoid_print
              print(value);
              if (value == 6) {
                Navigator.pushNamed(context, "SettingPage");
              }
            },
            color: Colors.white,
            icon: const Icon(
              Icons.more_vert,
              size: 28,
              // color: Colors.white,
            ),
            iconSize: 28,
            padding: const EdgeInsets.symmetric(vertical: 20),
            itemBuilder: (context) => [
              const PopupMenuItem(
                  value: 1,
                  child: Text("New Group",
                      style: TextStyle(
                          fontSize: 17, fontWeight: FontWeight.w500))),
              const PopupMenuItem(
                  value: 2,
                  child: Text("New Broadcast ",
                      style: TextStyle(
                          fontSize: 17, fontWeight: FontWeight.w500))),
              const PopupMenuItem(
                  value: 3,
                  child: Text("Linked Devices",
                      style: TextStyle(
                          fontSize: 17, fontWeight: FontWeight.w500))),
              const PopupMenuItem(
                  value: 4,
                  child: Text("Starred Message",
                      style: TextStyle(
                          fontSize: 17, fontWeight: FontWeight.w500))),
              const PopupMenuItem(
                  value: 5,
                  child: Text("Payment",
                      style: TextStyle(
                          fontSize: 17, fontWeight: FontWeight.w500))),
              const PopupMenuItem(
                  value: 6,
                  // onTap: (context) =>  Navigator.pushNamed(context, "SettingPage");,
                  child: Text("Settings",
                      style: TextStyle(
                          fontSize: 17, fontWeight: FontWeight.w500))),
            ],
          )
        ],
      );
    } else {
      return AppBar(
        elevation: 0,
        title: TextField(
          onTap: () {},
          onChanged: _updateSearchQuery,
          decoration: InputDecoration(
            fillColor: Colors.white,
            hintText: searchLabel(),
            border: InputBorder.none,
          ),
          style: TextStyle(color: Colors.white),
          cursorColor: Colors.white,
        ),
        actions: [
          IconButton(
            onPressed: handleSearchIconPress,
            icon: Icon(
              Icons.close,
              color: Colors.white,
              size: 28,
              // color: Colors.white,
            ),
          ),
        ],
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        initialIndex: 1,
        length: 6,
        child: Scaffold(
            appBar: PreferredSize(
                preferredSize:
                    ui.Size.fromHeight(70.0), // Sets the height of the AppBar
                child: _AppAndSearchBar(context)),
            body: Column(
              children: [
                Container(
                  color: const Color(0xff075e55),
                  child: TabBar(
                    onTap: handleTabChange,
                    isScrollable: true,
                    indicatorColor: Colors.white,
                    labelStyle: const TextStyle(
                        fontSize: 16, fontWeight: FontWeight.bold),
                    tabs: [
                      //tab1
                      Container(
                        width: 24,
                        child: const Tab(icon: Icon(Icons.camera_alt)),
                      ),
                      //tab2
                      Container(
                        width: 90,
                        child: Tab(
                          child: Row(
                            children: [
                              const Text("CHATS"),
                              const SizedBox(
                                width: 8,
                              ),
                              Container(
                                alignment: Alignment.center,
                                height: 22,
                                width: 22,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(20)),
                                child: const Text(
                                  "8",
                                  style: TextStyle(
                                      color: Color.fromARGB(255, 10, 136, 123),
                                      fontSize: 13),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),

                      Container(
                        width: 85,
                        child: const Tab(
                          child: Text("STATUS"),
                        ),
                      ),
                      Container(
                        width: 85,
                        child: const Tab(
                          child: Text("CALLS"),
                        ),
                      ),
                    ],
                  ),
                ),
                Flexible(
                  flex: 1,
                  child: TabBarView(
                    children: <Widget>[
                      //tab1
                      Container(
                        color: Colors.black,
                      ),
                      //tab2
                      Chatswidget(searchQuery: _searchQuery),
                      //tabp3
                      // MatrimonyProfileList(),
                      //tab4
                      Statuswidgets(searchQuery: _searchQuery),
                      // Container(
                      //   color: Colors.blue,
                      // ),
                      //tab5
                      Callswidgets(searchQuery: _searchQuery),
                      // tab 6
                      // SettingsPage(),
                      //tab 7
                    ],
                  ),
                )
              ],
            ))); //defaulTabcontroller
  }
}
