import 'package:flutter/material.dart';

import '../../utiles/AppColors.dart';
import '../../utiles/AppFonts.dart';
import '../../utiles/AppImages.dart';

typedef OnChange = void Function(dynamic);

class CustomDropDownMenu extends StatefulWidget {
  final List<String> items;
  String? selectedItem;
  OnChange? onChange;

  CustomDropDownMenu({
    super.key,
    required this.items,
    this.selectedItem,
    this.onChange,
  });

  @override
  State<CustomDropDownMenu> createState() => _CustomDropDownMenuState();
}

class _CustomDropDownMenuState extends State<CustomDropDownMenu> {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.whiteColor),
        borderRadius: BorderRadius.circular(16),
        //color: Colors.red
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton(
          padding: EdgeInsets.symmetric(horizontal: width*0.02),
          value: widget.selectedItem,
          icon: ImageIcon(
            AssetImage(AppImages.dropDownIcon),
            color: AppColors.whiteColor,
          ),
          isExpanded: true,
          dropdownColor: AppColors.whiteColor,
          // this set the color of the text when it's selected
          selectedItemBuilder: (context) {
            return widget.items.map((e) {
              return Align(
                alignment: Alignment.centerLeft,
                child: Text(e, style: AppFonts.medium20White),
              );
            }).toList();
          },
          items: widget.items.map((e) {
            return DropdownMenuItem<String>(
              value: e,
              child: Text(e, style: AppFonts.medium20Black),
            );
          }).toList(),
          onChanged: widget.onChange,
        ),
      ),
    );
  }
}
