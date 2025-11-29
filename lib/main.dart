import 'package:flutter/material.dart';
import 'package:news_app/providers/sources_provider.dart';
import 'package:news_app/providers/news_provider.dart';
import 'package:news_app/providers/theme_provider.dart';
import 'package:news_app/theme/AppTheme.dart';
import 'package:news_app/ui/home_screen/home_screen.dart';
import 'package:news_app/ui/news_screen/NewsScreen.dart';
import 'package:news_app/utiles/AppRoutes.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => SourceProvider()),
        ChangeNotifierProvider(create: (_) => ThemeProvider()),
        ChangeNotifierProvider(create: (_) => NewsProvider())
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: themeProvider.theme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.system,
      initialRoute: AppRoutes.homeScreen,
      routes: {
        AppRoutes.homeScreen: (_) => HomeScreen(),
        AppRoutes.newsScreen: (_) => NewsScreen(),
      },
    );
  }
}
