import 'package:flutter/material.dart';
import 'package:news_app/ui/home_screen/home_tab_bar.dart';
import 'package:news_app/ui/home_screen/news_list.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    print("this is the sources length ");
    return Scaffold(
      appBar: AppBar(
        title: Text("Home", style: Theme.of(context).textTheme.labelMedium),
      ),
      body: Column(
        children: [
          HomeTabBar(),
          Container(
            padding: EdgeInsets.symmetric(
              horizontal: width * 0.02,
              vertical: height * 0.01,
            ),
            width: width,
            height: height * 0.8,
            child: NewsList(),
          ),
        ],
      ),
    );
  }
}
