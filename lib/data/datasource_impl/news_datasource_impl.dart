import 'package:injectable/injectable.dart';
import 'package:news_hub/data/api/api_manager.dart';
import 'package:news_hub/data/api/model/news_response/News.dart';
import 'package:news_hub/data/datasource_contract/news_datasource.dart';

@Injectable(as: NewsDataSource)
class NewsDataSourceImpl extends NewsDataSource {
  ApiManager apiManager;

  @factoryMethod
  NewsDataSourceImpl({required this.apiManager});
  @override
  Future<List<News>?> getNews(String sourceId, int page) async {
    var response = await apiManager.getNews(sourceId, page);
    return response.articles;
  }

  @override
  Future<List<News>?> getSearchNews(String query) async {
    var response = await apiManager.getSearchNews(query);
    return response.articles;
  }
}
