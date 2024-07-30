import 'dart:convert';
import 'dart:ffi';

import 'package:http/http.dart' as http;
import 'package:injectable/injectable.dart';

import 'model/news_response/NewsResponse.dart';
import 'model/source_response/SourceResponse.dart';

@singleton //because i just want one object from ApiManager in the whole project
class ApiManager {
  static const String baseUrl =
      'newsapi.org'; //i made baseUrl static because i use it as parameter in the functions static (static must access static only)
  static const String apiKey = 'a20060cf9bea465baf282296652db138';
  //https://newsapi.org/v2/top-headlines/sources?apiKey=a20060cf9bea465baf282296652db138
  Future<SourceResponse> getSources(String categoryId) async {
    var uri = Uri.https(baseUrl, '/v2/top-headlines/sources', {
      'apiKey': apiKey,
      'category': categoryId,
    });
    var response = await http.get(uri);
    var json = jsonDecode(response.body);
    SourceResponse sourceResponse = SourceResponse.fromJson(json);
    return sourceResponse;
  }

  Future<NewsResponse> getNews(String sourceId, int page) async {
    var uri = Uri.https(baseUrl, '/v2/everything',
        {'apiKey': apiKey, 'sources': sourceId, 'page': page.toString()});
    var response = await http.get(uri);
    var json = jsonDecode(response
        .body); //jsonDecode => to convert response.body(String) to (json)
    NewsResponse newsResponse = NewsResponse.fromJson(json);
    return newsResponse;
  }

  Future<NewsResponse> getSearchNews(String query) async {
    var uri = Uri.https(baseUrl, '/v2/everything', {
      'apiKey': apiKey,
      'q': query,
    });
    var response = await http.get(uri);
    var json = jsonDecode(response
        .body); //jsonDecode => to convert response.body(String) to (json)
    NewsResponse newsResponse = NewsResponse.fromJson(json);
    return newsResponse;
  }
}
