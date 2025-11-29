import 'package:flutter/material.dart';
import 'package:news_app/apis/api_manager.dart';

class SourceProvider extends ChangeNotifier{
  String? category;
  Future? sourcesFuture;

  void setCategory(String category){
    this.category = category;
    sourcesFuture = ApiManager.getSources(category);
    notifyListeners();
  }
}