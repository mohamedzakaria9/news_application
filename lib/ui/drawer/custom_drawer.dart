import 'package:flutter/material.dart';
import 'package:news_app/ui/drawer/custom_drop_down_menu.dart';
import 'package:news_app/utiles/AppImages.dart';

import '../../utiles/AppColors.dart';
import '../../utiles/AppFonts.dart';

class CustomDrawer extends StatefulWidget {
  CustomDrawer({super.key});

  @override
  State<CustomDrawer> createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {
  String selectedItem = "White";
  String selectedLanguage = "English";

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    double sizedBoxWidth = width * 0.025;
    double sizedBoxHeight = height * 0.02;
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
          Padding(
            padding: EdgeInsets.symmetric(horizontal: width * 0.05),
            child: Column(
              children: [
                SizedBox(height: sizedBoxHeight),
                Row(
                  children: [
                    ImageIcon(
                      AssetImage(AppImages.homeIcon),
                      color: AppColors.whiteColor,
                    ),
                    SizedBox(width: sizedBoxWidth),
                    Text("Go To Home", style: AppFonts.bold20White),
                  ],
                ),
                SizedBox(height: sizedBoxHeight),
                Divider(height: 2, endIndent: 2),
                SizedBox(height: sizedBoxHeight),
                Row(
                  children: [
                    ImageIcon(
                      AssetImage(AppImages.themeIcon),
                      color: AppColors.whiteColor,
                    ),
                    SizedBox(width: sizedBoxWidth),
                    Text("Theme", style: AppFonts.bold20White),
                  ],
                ),
                SizedBox(height: sizedBoxHeight),
                CustomDropDownMenu(
                  items: ["White", "Black"],
                  selectedItem: selectedItem,
                  onChange: (value) {
                    selectedItem = value;
                    setState(() {});
                  },
                ),
                SizedBox(height: sizedBoxHeight),
                Divider(height: 2, endIndent: 2),
                SizedBox(height: sizedBoxHeight),
                Row(
                  children: [
                    ImageIcon(
                      AssetImage(AppImages.languageIcon),
                      color: AppColors.whiteColor,
                    ),
                    SizedBox(width: sizedBoxWidth),
                    Text("Language", style: AppFonts.bold20White),
                  ],
                ),
                SizedBox(height: sizedBoxHeight),
                CustomDropDownMenu(
                  items: ["English", "Arabic"],
                  selectedItem: selectedLanguage,
                  onChange: (value) {
                    selectedLanguage = value;
                    setState(() {});
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
