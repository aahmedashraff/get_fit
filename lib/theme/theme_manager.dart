import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeManager with ChangeNotifier {
  final String Key = 'theme';
  SharedPreferences prefs;
  bool _darktheme;
  bool get darkTheme => _darktheme;
  ThemeMode _themeMode = ThemeMode.light;
  get themeMode => _themeMode;
  ThemeManager() {
    _darktheme = true;
  }
  toggleTheme() {
    _darktheme = !_darktheme;
    // _themeMode = isDark ? ThemeMode.dark : ThemeMode.light;
    _saveToPrefs();

    notifyListeners();
  }

  _initPrefs() async {
    if (prefs == null) prefs = await SharedPreferences.getInstance();
  }

  _loadFromPrefs() async {
    await _initPrefs();
    _darktheme = prefs.getBool(Key) ?? true;
    notifyListeners();
  }

  _saveToPrefs() async {
    await _initPrefs();
    prefs.setBool(Key, _darktheme);
  }
}
