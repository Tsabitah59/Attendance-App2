import 'package:flutter/foundation.dart';

class ThemeProvider extends ChangeNotifier{
  bool _isDarkTheme = false;

  ThemeProvider() {
    _loadTheme();
  }

  bool get isDarkTheme => _isDarkTheme;

  void toggleTheme() {
    
  }
}