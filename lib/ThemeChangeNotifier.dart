

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:whatsapp_clone/theme.dart';

class ThemeNotifier extends ChangeNotifier {
  final brightness = PlatformDispatcher.instance.platformBrightness;

  ThemeData _themeMode = lightTheme;
 
  ThemeData get themeMode => _themeMode;

  bool _isDark = false;
  bool get isDark => _isDark;

  void setThemeMode(bool isDark) {
    _isDark = isDark;
    _themeMode = isDark ? darkTheme : lightTheme;
    print(_isDark);
    print(_themeMode);
    notifyListeners();
  }
}
