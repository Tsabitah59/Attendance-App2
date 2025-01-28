import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeProvider extends ChangeNotifier{
  bool _isDarkTheme = false;

  ThemeProvider() {
    _loadTheme();
  }

  bool get isDarkTheme => _isDarkTheme;

  void toggleTheme(bool isDark) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    _isDarkTheme = isDark;
    await prefs.setBool('isDarkTheme', isDark);
    notifyListeners();
  }

  void _loadTheme() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    _isDarkTheme = prefs.getBool('isDarkTheme') ?? false;
    notifyListeners();
  }
}