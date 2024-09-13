import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyProvider extends ChangeNotifier {
  ThemeMode mode = ThemeMode.light;

  void getTheme() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    bool? isDark = prefs.getBool("isdark");

    if (isDark != null) {
      isDark == true ? mode = ThemeMode.dark : mode = ThemeMode.light;

      notifyListeners();
    }
  }

  changeTheme(ThemeMode themeMode) async {
    mode = themeMode;
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isdark', mode == ThemeMode.dark);
    notifyListeners();
  }
}
