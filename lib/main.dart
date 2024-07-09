import 'dart:nativewrappers/_internal/vm/lib/internal_patch.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:whatsapp_clone/Chatpage.dart';
import 'package:whatsapp_clone/SettingsPage.dart';
import 'package:whatsapp_clone/ThemeChangeNotifier.dart';
import 'package:whatsapp_clone/home.dart';
import 'package:whatsapp_clone/theme.dart';
import  'package:whatsapp_clone/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';





void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => ThemeNotifier(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Locale _locale = Locale('en,us');

   void _changeLanguage(Locale locale) {
    setState(() {
      _locale = locale;
    });
  }
  // get class => null;
  
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeNotifier>(
      builder: (context, value, child) {
        var materialApp = const MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Whatsapp clone ',
           supportedLocales: [
        Locale('en', ''), // English
        Locale('es', ''), // Spanish
      ],
     localizationsDelegates: [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
     ]

  var MyApp extends StatefulWidget {
  final Function(Locale) onLocaleChange;

  MyHomePage({@required this.onLocaleChange});
   

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context).translate('title')),
        actions: [
          DropdownButton<Locale>(
            onChanged: (Locale locale) {
              onLocaleChange(locale);
            },
            items: [
              DropdownMenuItem(
                value: Locale('en'),
                child: Text('English'),
              ),
              DropdownMenuItem(
                value: Locale('es'),
                child: Text('Hindi'),
              ),
            ],
          ),
        ],
      ),
      body: Center(
        child: Text(AppLocalizations.of(context).translate('title')),
      ),
    );
  }
},
      
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
        return materialApp;
      },
    );
  }
}


