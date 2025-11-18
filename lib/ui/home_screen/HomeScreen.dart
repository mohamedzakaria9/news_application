import 'package:flutter/material.dart';
import 'package:news_app/ui/home_screen/home_tab_bar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    print("this is the sources length ");
    return Scaffold(
      appBar: AppBar(
        title: Text("Home", style: Theme.of(context).textTheme.labelMedium),
      ),
      body: HomeTabBar(),
    );
  }
}
