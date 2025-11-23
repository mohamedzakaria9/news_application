import 'package:flutter/material.dart';
import 'package:news_app/ui/news_screen/news_tab_bar.dart';
import 'package:news_app/ui/news_screen/news_list.dart';

class NewsScreen extends StatefulWidget {
  const NewsScreen({super.key});

  @override
  State<NewsScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<NewsScreen> {
  @override
  Widget build(BuildContext context) {
    var category = ModalRoute.of(context)!.settings.arguments as String;
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    print("this is the sources length ");
    return Scaffold(
      appBar: AppBar(
        title: Text(category, style: Theme.of(context).textTheme.labelMedium),
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
