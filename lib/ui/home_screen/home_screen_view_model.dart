import 'package:flutter/cupertino.dart';
import 'package:news_app/models/SourceResponce.dart';

import '../../apis/api_manager.dart';
import '../../utiles/AppImages.dart';

class HomeScreenViewModel extends ChangeNotifier{
  //hold data - handle logic
  String? category;
  List<Sources>? sourcesFuture;
  String? errorMessage;
  final List<String> lightThemeImages = [
    AppImages.generalImageLight,
    AppImages.businessImageLight,
    AppImages.sportImageLight,
    AppImages.technologyImageLight,
    AppImages.entertainmentImageLight,
    AppImages.healthImageLight,
    AppImages.scienceImageLight,
  ];
  final List<String> darkThemeImages = [
    AppImages.generalImageDark,
    AppImages.businessImageDark,
    AppImages.sportImageDark,
    AppImages.technologyImageDark,
    AppImages.entertainmentImageDark,
    AppImages.healthImageDark,
    AppImages.scienceImageDark,
  ];

  final List<String> categoryParameterName = [
    "general",
    "business",
    "sports",
    "technology",
    "entertainment",
    "health",
    "science",
  ];
  void setCategory(String category) async{
    this.category = category;
    try{
      var response = await ApiManager.getSources(category);
      if(response?.status == "error"){
        errorMessage = response!.message;
        print("there is an error in the response $errorMessage");
      }else{
        sourcesFuture = response!.sources;
        print("there is no error in the sources ");
      }
    }catch(e){
      errorMessage = e.toString();
    }
    notifyListeners();
  }
}