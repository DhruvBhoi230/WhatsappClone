import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:whatsapp_clone/Chatpage.dart';
import 'package:whatsapp_clone/SettingsPage.dart';
import 'package:whatsapp_clone/ThemeChangeNotifier.dart';
import 'package:whatsapp_clone/home.dart';
import 'package:whatsapp_clone/theme.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => ThemeNotifier(),
      child: MyApp(),
    ),);
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeNotifier>(
      builder: (context, value, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Whatsapp clone ',
          // theme: ThemeData(
          //   iconTheme: const IconThemeData(color: Colors.white),
          //   scaffoldBackgroundColor: Colors.white,
          //   popupMenuTheme: const PopupMenuThemeData(iconColor: Colors.white),
          //   tabBarTheme: const TabBarTheme(
          //       labelColor: Colors.white, unselectedLabelColor: Colors.white54),
          //   appBarTheme: const AppBarTheme(
          //       color: Color(0xff075e55),
          //       titleTextStyle: TextStyle(color: Colors.white),
          //       iconTheme: IconThemeData(color: Colors.white)),
          //   bottomSheetTheme: BottomSheetThemeData(
          //       backgroundColor: Colors.black.withOpacity(0)),
          // ),
          theme: value.themeMode,
          routes: {
            "/": (context) => const HomePage(),
            "SettingPage": (context) => SettingsPage(),
            "Chatpage": (context) => Chatpage(),
          },
        );
      },
    );
  }
}
