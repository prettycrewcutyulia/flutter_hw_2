import 'package:flutter/material.dart';
import 'package:flutter_news/helpers/theme/theme_preference.dart';

class ThemeModel extends ChangeNotifier {
  late bool _isDark;
  late ThemePreferences _preferences;

  bool get isDark => _isDark;

  ThemeModel() {
    _isDark = false;
    _preferences = ThemePreferences();
    getPreferences();
  }

  set isDark(bool value) {
    _isDark = value;
    _preferences.setTheme(value);
    notifyListeners();
  }

  void getPreferences() async {
    _isDark = await _preferences.getTheme();
    notifyListeners();
  }
}

final ThemeData lightTheme = ThemeData(
  brightness: Brightness.light,
  textSelectionTheme: const TextSelectionThemeData(selectionColor: Colors.blue),
  textTheme: const TextTheme(
    titleLarge: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
    bodyLarge: TextStyle(fontSize: 18, fontWeight: FontWeight.normal),
    labelLarge: TextStyle(
        color: Colors.blue, decoration: TextDecoration.underline, fontSize: 20),
  ),
);

final ThemeData darkTheme = ThemeData(
  brightness: Brightness.dark,
  textSelectionTheme:
  const TextSelectionThemeData(selectionColor: Colors.purpleAccent),
  textTheme: const TextTheme(
    titleLarge: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
    bodyLarge: TextStyle(fontSize: 18, fontWeight: FontWeight.normal),
    labelLarge: TextStyle(
        color: Colors.blue, decoration: TextDecoration.underline, fontSize: 20),
  ),
);
