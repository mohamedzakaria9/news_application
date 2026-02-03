import 'package:flutter/material.dart';
import 'package:news_app/ui/home_screen/home_screen_view_model.dart';
import 'package:news_app/ui/news_screen/news_screen_view_model.dart';
import 'package:provider/provider.dart';
import '../../utiles/AppColors.dart';

class HomeTabBar extends StatefulWidget {
  const HomeTabBar({super.key});

  @override
  State<HomeTabBar> createState() => _HomeTabBarState();
}

class _HomeTabBarState extends State<HomeTabBar> {
  final bool _initialized = false;

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();

    if (_initialized) return;

    final homeVM = context.watch<HomeScreenViewModel>();
    final newsVM = context.read<NewsScreenViewModel>();
    if (homeVM.sourcesFuture != null) {
      newsVM.setSourceId(homeVM.sourcesFuture![0].id!);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Consumer2<HomeScreenViewModel, NewsScreenViewModel>(
      builder: (context, homeScreenViewModel, newsScreenViewModel, child) {
        if (homeScreenViewModel.sourcesFuture == null) {
          return Center(
            child: CircularProgressIndicator(
              color: Theme.of(context).primaryColor,
            ),
          );
        } else if (newsScreenViewModel.errorMessage != null) {
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
          return DefaultTabController(
            length: homeScreenViewModel.sourcesFuture!.length,
            child: TabBar(
              onTap: (value) {
                newsScreenViewModel.newsFuture = null;
                newsScreenViewModel.errorMessage = null;
                newsScreenViewModel.sourceId = null;
                newsScreenViewModel.setSourceId(
                  homeScreenViewModel.sourcesFuture![value].id!,
                );
              },
              isScrollable: true,
              indicatorColor: Theme.of(context).primaryColor,
              dividerColor: AppColors.transparentColor,
              tabAlignment: TabAlignment.start,
              unselectedLabelStyle: Theme.of(context).textTheme.labelSmall,
              labelStyle: Theme.of(context).textTheme.labelLarge,
              tabs: homeScreenViewModel.sourcesFuture!.map<Widget>((e) {
                // print("this is print from the tabs of the news tab bar");
                // print("this is the name of the source ${e.name!}");
                return Tab(text: e.name!);
              }).toList(),
            ),
          );
        }
      },
    );
  }
}
