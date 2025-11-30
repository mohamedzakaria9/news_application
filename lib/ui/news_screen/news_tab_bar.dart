import 'package:flutter/material.dart';
import 'package:news_app/providers/news_provider.dart';
import 'package:news_app/providers/sources_provider.dart';
import 'package:provider/provider.dart';

import '../../apis/api_manager.dart';
import '../../utiles/AppColors.dart';

class HomeTabBar extends StatefulWidget {
  const HomeTabBar({super.key});

  @override
  State<HomeTabBar> createState() => _HomeTabBarState();
}

class _HomeTabBarState extends State<HomeTabBar> {
  @override
  Widget build(BuildContext context) {

    return Consumer2<SourceProvider,NewsProvider>(
      builder: (context, value, value2, child) {
        return FutureBuilder(
          future: value.sourcesFuture,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(
                  color: Theme.of(context).primaryColor,
                ),
              );
            } else if (snapshot.hasError) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("SomeThing went wrong"),
                    ElevatedButton(
                      onPressed: () {
                        // ApiManager.getSources(category);
                        setState(() {});
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.geryColor,
                      ),
                      child: Text(
                        "Try Again",
                        style: Theme.of(context).textTheme.labelMedium,
                      ),
                    ),
                  ],
                ),
              );
            } else {
              if (snapshot.data!.status != "error") {
                // print("this is print from the no error place");
                if(value2.sourceId == null){
                  WidgetsBinding.instance.addPostFrameCallback((_) {
                    value2.setSourceId(snapshot.data!.sources![0].id!);
                  },);
                }
                return DefaultTabController(
                  length: snapshot.data!.sources!.length,
                  child: TabBar(
                    onTap: (value) {
                      // print("this is the index we have selected $value");
                      value2.setSourceId(snapshot.data!.sources![value].id!);
                      // print(
                      //   "this is the value of the index stored in the provider ${value2.sourceId}",
                      // );
                    },
                    isScrollable: true,
                    indicatorColor: Theme.of(context).primaryColor,
                    dividerColor: AppColors.transparentColor,
                    tabAlignment: TabAlignment.start,
                    unselectedLabelStyle: Theme.of(context).textTheme.labelSmall,
                    labelStyle: Theme.of(context).textTheme.labelLarge,
                    tabs: snapshot.data!.sources!.map<Widget>((e) {

                      // print("this is print from the tabs of the news tab bar");
                      // print("this is the name of the source ${e.name!}");
                      return Tab(text: e.name!);
                    }).toList(),
                  ),
                );
              } else {
                return Column(
                  children: [
                    Text(snapshot.data!.message!),
                    ElevatedButton(onPressed: () {}, child: Text("Try Again")),
                  ],
                );
              }
            }
          },
        );
      }
    );
  }
}
