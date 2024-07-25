import 'package:injectable/injectable.dart';
import 'package:news_hub/data/api/api_manager.dart';
import 'package:news_hub/data/api/model/source_response/Source.dart';
import 'package:news_hub/data/datasource_contract/news_source_datasource.dart';

@Injectable(
    as: NewsSourceDataSource) // when you want object from (NewsSourceDataSource) => i well give you object from (NewsSourceDataSourceImpl)[it's child]
class NewsSourceDataSourceImpl extends NewsSourceDataSource {
  ApiManager apiManager;
  @factoryMethod
  NewsSourceDataSourceImpl({required this.apiManager}); // dependency injection;
  @override
  Future<List<Source>?> getSources(String categoryId) async {
    var response = await apiManager.getSources(categoryId);
    return response.sources;
  }
}
