// ignore_for_file: prefer_const_constructors, unused_import

import 'package:flutter/material.dart';
import 'package:whatsapp_clone/Callswidgets.dart';
import 'package:whatsapp_clone/Statuswidgets.dart';
import 'package:whatsapp_clone/SettingsPage.dart';
import 'package:whatsapp_clone/chatswidgets.dart';
import 'package:whatsapp_clone/person_list.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        initialIndex: 1,
        length: 6,
        child: Scaffold(
            appBar: PreferredSize(
              preferredSize: const Size.fromHeight(70),
              child: AppBar(
                elevation: 0,
                title: const Text(
                  'WhatsApp',
                  style: TextStyle(fontSize: 21),
                ),
                actions: [
                  const Padding(
                    padding: EdgeInsets.only(top: 12.0, right: 15),
                    child: Icon(
                      Icons.search,
                      size: 28,
                      // color: Colors.white,
                    ),
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
              ),
            ),
            body: Column(
              children: [
                Container(
                  color: const Color(0xff075e55),
                  child: TabBar(
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
                                      color: Color(0xff075e55), fontSize: 13),
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
                      Chatswidget(),
                      //tabp3
                      // MatrimonyProfileList(),
                      //tab4
                      Statuswidgets(),
                      // Container(
                      //   color: Colors.blue,
                      // ),
                      //tab5
                      Callswidgets(),
                      // tab 6
                      SettingsPage(),
                    ],
                  ),
                )
              ],
            ))); //defaulTabcontroller
  }
}
