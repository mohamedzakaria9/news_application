import 'package:flutter/material.dart';

class LocalizationProvider extends ChangeNotifier {
  Locale locale = Locale("en");

  void toggleLanguage() {
    if (locale == Locale("en")) {
      locale = Locale("ar");
    } else if (locale == Locale("ar")) {
      locale = Locale("en");
    }
    notifyListeners();
  }
}
