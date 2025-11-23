import 'package:flutter/material.dart';
import 'package:news_app/providers/source_provider.dart';
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
    var sourceProvider = Provider.of<SourceProvider>(context, listen: false);
    String category = ModalRoute.of(context)!.settings.arguments as String;
    return FutureBuilder(
      future: ApiManager.getSources(category),
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
                    ApiManager.getSources(category);
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
            print("this is print from the no error place");
            if(sourceProvider.sourceId == null){
              WidgetsBinding.instance.addPostFrameCallback((_) {
                sourceProvider.setSourceId(snapshot.data!.sources![0].id!);
              },);
            }
            return DefaultTabController(
              length: snapshot.data!.sources!.length,
              child: TabBar(
                onTap: (value) {
                  print("this is the index we have selected $value");
                  sourceProvider.setSourceId(snapshot.data!.sources![value].id!);
                  print(
                    "this is the value of the index stored in the provider ${sourceProvider.sourceId}",
                  );
                },
                isScrollable: true,
                indicatorColor: Theme.of(context).primaryColor,
                dividerColor: AppColors.transparentColor,
                tabAlignment: TabAlignment.start,
                unselectedLabelStyle: Theme.of(context).textTheme.labelSmall,
                labelStyle: Theme.of(context).textTheme.labelLarge,
                tabs: snapshot.data!.sources!.map((e) {
                  e.id!;
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
}
