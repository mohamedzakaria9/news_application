import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:news_app/apis/api_constants.dart';
import 'package:news_app/apis/endpoints.dart';
import 'package:news_app/models/NewsResponce.dart';
import 'package:news_app/models/SourceResponce.dart';

class ApiManager {
  static Future<SourceResponce?> getSources() async {
    Uri url = Uri.https(ApiConstants.baseUrl, EndPoints.sourcesEndPoint, {
      "apiKey": ApiConstants.apiKey,
    });
    var response = await http.get(url);
    return SourceResponce.fromJson(jsonDecode(response.body));
  }

  static Future<NewsResponce> getNews(String sourceId) async {
    Uri url = Uri.https(ApiConstants.baseUrl, EndPoints.everythingEndPoint, {
      "apiKey": ApiConstants.apiKey,
      "sources": sourceId,
      "pageSize": "10",
    });
    var response = await http.get(url);

    return NewsResponce.fromJson(jsonDecode(response.body));
  }
}
