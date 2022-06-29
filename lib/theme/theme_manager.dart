import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeManager with ChangeNotifier {
  final String Key = 'theme';
  SharedPreferences _prefs;
  bool _darktheme;
  bool get darkTheme => _darktheme;
  ThemeMode _themeMode = ThemeMode.light;
  get themeMode => _themeMode;

  ThemeManager() {
    _darktheme = true;
    _loadFromPrefs();
  }
  toggleTheme() {
    _darktheme = !_darktheme;
    // _themeMode = isDark ? ThemeMode.dark : ThemeMode.light;
    _saveToPrefs();

    notifyListeners();
  }

  _initPrefs() async {
    if (_prefs == null) _prefs = await SharedPreferences.getInstance();
  }

  _loadFromPrefs() async {
    await _initPrefs();
    _darktheme = _prefs.getBool(Key) ?? true;
    notifyListeners();
  }

  _saveToPrefs() async {
    await _initPrefs();
    _prefs.setBool(Key, _darktheme);
  }
}
