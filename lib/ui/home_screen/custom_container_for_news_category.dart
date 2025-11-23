import 'package:flutter/material.dart';
import 'package:news_app/utiles/AppImages.dart';

import '../../utiles/AppColors.dart';

class CustomContainerForNewsCategory extends StatelessWidget {
  final String imagePath;
  final int index;
  final VoidCallback onTap;
  const CustomContainerForNewsCategory({
    super.key,
    required this.imagePath,
    required this.index,
    required this.onTap
  });

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Container(
      height: height * 0.23,
      padding: EdgeInsets.symmetric(
        vertical: height * 0.03,
        horizontal: width * 0.05,
      ),
      alignment: index % 2 == 1 ? Alignment.bottomLeft : Alignment.bottomRight,
      decoration: BoxDecoration(
        color: AppColors.transparentColor,
        image: DecorationImage(image: AssetImage(imagePath), fit: BoxFit.fill),
      ),
      child: Container(
        padding: index % 2 == 0
            ? EdgeInsets.only(left: width * 0.03)
            : EdgeInsets.only(right: width * 0.03),
        width: width * 0.38,
        decoration: BoxDecoration(
          color: AppColors.geryColor,
          borderRadius: BorderRadius.circular(30),
        ),
        child: InkWell(
          onTap: onTap,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            textDirection: index % 2 == 0 ? TextDirection.ltr : TextDirection.rtl,
            children: [
              Text("View All", style: Theme.of(context).textTheme.bodyLarge),
              Container(
                decoration: BoxDecoration(
                  color: Theme.of(context).scaffoldBackgroundColor,
                  borderRadius: BorderRadius.circular(60),
                ),
                child: ImageIcon(
                  AssetImage(
                    index % 2 == 0
                        ? AppImages.viewAllIcon
                        : AppImages.viewAllIconLeft,
                  ),
                  color: Theme.of(context).primaryColor,
                  size: 40,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
