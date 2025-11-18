import 'package:flutter/material.dart';

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
    return FutureBuilder(
      future: ApiManager.getSources(),
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
                    ApiManager.getSources();
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
            return DefaultTabController(
              length: snapshot.data!.sources!.length,
              child: TabBar(
                onTap: (value) {
                  print("this is the index we have selected $value");
                },
                isScrollable: true,
                indicatorColor: Theme.of(context).primaryColor,
                dividerColor: AppColors.transparentColor,
                tabAlignment: TabAlignment.start,
                unselectedLabelStyle: Theme.of(context).textTheme.labelSmall,
                labelStyle: Theme.of(context).textTheme.labelLarge,
                tabs: snapshot.data!.sources!.map((e) {
                  return Tab(
                    child: Text(
                      e.name!,
                    ),

                  );
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
}
