import 'package:injectable/injectable.dart';
import 'package:news_hub/data/api/model/news_response/News.dart';
import 'package:news_hub/repository_contract/news_repository.dart';

import '../datasource_contract/news_datasource.dart';

@Injectable(as: NewsRepository)
class NewsRepositoryImpl extends NewsRepository {
  NewsDataSource newsDataSource;
  @factoryMethod
  NewsRepositoryImpl({required this.newsDataSource});
  @override
  Future<List<News>?> getNews(String sourceId, int page) {
    return newsDataSource.getNews(sourceId, page);
  }

  @override
  Future<List<News>?> getSearchNews(String query) {
    return newsDataSource.getSearchNews(query);
  }
}
