import 'package:news_hub/data/api/model/news_response/News.dart';

abstract class NewsRepository {
  Future<List<News>?> getNews(String sourceId, int page);
  Future<List<News>?> getSearchNews(String query);
}
