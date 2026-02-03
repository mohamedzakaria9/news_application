import 'package:flutter/material.dart';
import 'package:news_app/models/NewsResponce.dart';

import '../../apis/api_manager.dart';

class NewsScreenViewModel extends ChangeNotifier {
  String? sourceId;
  List<Articles>? newsFuture;
  String? errorMessage;

  void setSourceId(String sourceId) async {
    this.sourceId = sourceId;
    try {
      print("iam in the set source in the news screen view model ");
      var response = await ApiManager.getNews(sourceId);
      if (response.status == "error") {
        errorMessage = response.message;
        print("i found this error in while getting the news $errorMessage");
      } else {
        newsFuture = response.articles;
        print("there is no errors");
      }
    } catch (e) {
      errorMessage = e.toString();
      print("i found this error $errorMessage");
    }
    notifyListeners();
  }
}
