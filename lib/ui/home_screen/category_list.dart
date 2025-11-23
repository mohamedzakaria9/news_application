import 'package:flutter/material.dart';
import 'package:news_app/ui/home_screen/custom_container_for_news_category.dart';
import 'package:news_app/utiles/AppColors.dart';

import '../../utiles/AppFonts.dart';

class CategoryList extends StatelessWidget {
  final List<String> categories;

  const CategoryList({super.key, required this.categories});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return ListView.separated(
      itemBuilder: (context, index) {
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
                      print("this is print from index $index");
                    },
                  ),
                ],
              )
            : CustomContainerForNewsCategory(
                imagePath: categories[index],
                index: index,
                onTap: () {
                  print("this is print from index $index");
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
