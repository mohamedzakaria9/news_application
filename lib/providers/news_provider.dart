import 'package:flutter/material.dart';

import '../apis/api_manager.dart';

class NewsProvider extends ChangeNotifier {
  String? sourceId;
  Future? newsFuture;

  void setSourceId(String sourceId) {
    this.sourceId = sourceId;
    newsFuture = ApiManager.getNews(sourceId);
    notifyListeners();
  }
}
