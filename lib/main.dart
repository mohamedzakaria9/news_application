import 'package:flutter/material.dart';
import 'package:news_app/theme/AppTheme.dart';
import 'package:news_app/ui/HomeScreen.dart';
import 'package:news_app/utiles/AppRoutes.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.darkTheme,
      initialRoute: AppRoutes.homeScreen,
      routes: {
        AppRoutes.homeScreen : (context) => HomeScreen()
      },
    );
  }
}