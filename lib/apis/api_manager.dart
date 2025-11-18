import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:news_app/apis/api_constants.dart';
import 'package:news_app/apis/endpoints.dart';
import 'package:news_app/models/SourceResponce.dart';

class ApiManager {
  static Future<SourceResponce?> getSources() async {
    Uri url = Uri.https(ApiConstants.baseUrl, EndPoints.sourcesEndPoint, {
      "apiKey": ApiConstants.apiKey,
    });
    var response = await http.get(url);
    return SourceResponce.fromJson(jsonDecode(response.body));
  }
}
