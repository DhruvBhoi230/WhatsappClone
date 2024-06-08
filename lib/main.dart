import 'package:flutter/material.dart';
import 'package:whatsapp_clone/Chatpage.dart';
import 'package:whatsapp_clone/SettingsPage.dart';
import 'package:whatsapp_clone/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Whatsapp clone ',
      theme: ThemeData(
        iconTheme: const IconThemeData(color: Colors.white),
        scaffoldBackgroundColor: Colors.white,
        popupMenuTheme: const PopupMenuThemeData(iconColor: Colors.white),
        tabBarTheme: const TabBarTheme(
            labelColor: Colors.white, unselectedLabelColor: Colors.white54),
        appBarTheme: const AppBarTheme(
            color: Color(0xff075e55),
            titleTextStyle: TextStyle(color: Colors.white),
            iconTheme: IconThemeData(color: Colors.white)),
        bottomSheetTheme:
            BottomSheetThemeData(backgroundColor: Colors.black.withOpacity(0)),
      ),
      routes: {
        "/": (context) => const HomePage(),
        "SettingPage": (context) => SettingsPage(),
        "Chatpage": (context) => Chatpage(),
      },
    );
  }
}
