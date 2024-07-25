import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:news_hub/model/news_response/NewsResponse.dart';
import 'package:news_hub/model/source_response/SourceResponse.dart';

class ApiManager {
  static const String baseUrl =
      'newsapi.org'; //i made baseUrl static because i use it as parameter in the functions static (static must access static only)
  static const String apiKey = 'a20060cf9bea465baf282296652db138';
  //https://newsapi.org/v2/top-headlines/sources?apiKey=a20060cf9bea465baf282296652db138
  static Future<SourceResponse> getSources(String categoryId) async {
    var uri = Uri.https(baseUrl, '/v2/top-headlines/sources', {
      'apiKey': apiKey,
      'category': categoryId,
    });
    var response = await http.get(uri);
    var json = jsonDecode(response.body);
    SourceResponse sourceResponse = SourceResponse.fromJson(json);
    return sourceResponse;
  }

  static Future<NewsResponse> getNews(String sourceId) async {
    var uri = Uri.https(baseUrl, '/v2/everything', {
      'apiKey': apiKey,
      'sources': sourceId,
    });
    var response = await http.get(uri);
    var json = jsonDecode(response
        .body); //jsonDecode => to convert response.body(String) to (json)
    NewsResponse newsResponse = NewsResponse.fromJson(json);
    return newsResponse;
  }
}
