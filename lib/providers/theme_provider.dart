import 'package:flutter/material.dart';

import '../theme/AppTheme.dart';

class ThemeProvider extends ChangeNotifier{
  ThemeData theme = AppTheme.lightTheme;
  void toggleTheme(){
    if(theme == AppTheme.lightTheme){
      theme = AppTheme.darkTheme;
    }else{
      theme = AppTheme.lightTheme;
    }
    notifyListeners();
  }
}