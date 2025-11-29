import 'package:flutter/material.dart';
import 'package:news_app/utiles/AppImages.dart';

import '../../utiles/AppColors.dart';
import '../../utiles/AppFonts.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Drawer(
      backgroundColor: AppColors.blackColor,
      child: Column(
        children: [
          Container(
            alignment: Alignment.center,
            decoration: BoxDecoration(color: AppColors.whiteColor),
            width: double.infinity,
            height: height * 0.25,
            child: Text("News App", style: AppFonts.bold24Black),
          ),
          Row(
            children: [
              ImageIcon(
                AssetImage(AppImages.homeIcon),
                color: AppColors.whiteColor,
              ),
              SizedBox(width: width*0.04,),
              Text("Go To Home",style: AppFonts.bold20White,)
            ],
          ),
        ],
      ),
    );
  }
}
