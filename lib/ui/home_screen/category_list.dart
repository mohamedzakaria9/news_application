import 'package:flutter/material.dart';
import 'package:news_app/apis/api_constants.dart';
import 'package:news_app/providers/news_provider.dart';
import 'package:news_app/providers/sources_provider.dart';
import 'package:news_app/ui/home_screen/custom_container_for_news_category.dart';
import 'package:news_app/utiles/AppRoutes.dart';
import 'package:provider/provider.dart';

class CategoryList extends StatelessWidget {
  final List<String> categories;

  const CategoryList({super.key, required this.categories});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return ListView.separated(
      itemBuilder: (context, index) {
        return Consumer<SourceProvider>(
          builder: (context, value, child) {
            return index == 0
                ? Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(
                        "Good Morning\nHere Is Some News For You",
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                      CustomContainerForNewsCategory(
                        imagePath: categories[index],
                        index: index,
                        onTap: () {
                          value.setCategory(ApiConstants.categoryParameterName[index]);
                          Navigator.popAndPushNamed(
                            context,
                            AppRoutes.newsScreen,
                            arguments:
                                ApiConstants.categoryParameterName[index],
                          );
                        },
                      ),
                    ],
                  )
                : CustomContainerForNewsCategory(
                    imagePath: categories[index],
                    index: index,
                    onTap: () {
                      value.setCategory(ApiConstants.categoryParameterName[index]);
                      Navigator.popAndPushNamed(
                        context,
                        AppRoutes.newsScreen,
                        arguments: ApiConstants.categoryParameterName[index],
                      );
                    },
                  );
          },
        );
      },
      separatorBuilder: (context, index) {
        return SizedBox(height: height * 0.01);
      },
      itemCount: categories.length,
    );
  }
}
