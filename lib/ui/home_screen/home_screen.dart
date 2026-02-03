import 'package:flutter/material.dart';
import 'package:news_app/l10n/app_localizations.dart';
import 'package:news_app/providers/theme_provider.dart';
import 'package:news_app/theme/AppTheme.dart';
import 'package:news_app/ui/home_screen/category_list.dart';
import 'package:news_app/ui/home_screen/home_screen_view_model.dart';
import 'package:news_app/utiles/AppImages.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
   const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    var theme = Provider.of<ThemeProvider>(context);
    return Consumer<HomeScreenViewModel>(
      builder: (context, homeScreenViewModel, child) {
        return Scaffold(
          appBar: AppBar(
            title: Text(
              AppLocalizations.of(context)!.home,
              style: Theme.of(context).textTheme.labelMedium,
            ),
            actions: [
              IconButton(
                onPressed: () {},
                icon: ImageIcon(
                  AssetImage(AppImages.searchIcon),
                  color: Theme.of(context).primaryColor,
                ),
              ),
            ],
          ),
          body: Padding(
            padding: EdgeInsets.symmetric(horizontal: width * 0.03),
            child: CategoryList(
              categories: theme.theme == AppTheme.lightTheme
                  ? homeScreenViewModel.lightThemeImages
                  : homeScreenViewModel.darkThemeImages,
            ),
          ),
        );
      }
    );
  }
}
