import 'package:flutter/material.dart';
import 'package:news_app/providers/source_provider.dart';
import 'package:news_app/theme/AppTheme.dart';
import 'package:news_app/ui/home_screen/HomeScreen.dart';
import 'package:news_app/utiles/AppRoutes.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => SourceProvider())],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.system,
      initialRoute: AppRoutes.homeScreen,
      routes: {AppRoutes.homeScreen: (context) => HomeScreen()},
    );
  }
}
