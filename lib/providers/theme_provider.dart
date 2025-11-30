import 'package:flutter/material.dart';

import '../theme/AppTheme.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeData theme = AppTheme.darkTheme;

  void toggleTheme(String value) {
    if (value == "White") {
      theme = AppTheme.lightTheme;
    } else if (value == "Black") {
      theme = AppTheme.darkTheme;
    }
    notifyListeners();
  }
}
