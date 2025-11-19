import 'package:flutter/material.dart';

class SourceProvider extends ChangeNotifier {
  String? sourceId;

  void setSourceId(String sourceId) {
    this.sourceId = sourceId;
    notifyListeners();
  }
}
