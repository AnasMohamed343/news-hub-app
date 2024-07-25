import 'package:injectable/injectable.dart';
import 'package:news_hub/data/api/model/source_response/Source.dart';
import 'package:news_hub/data/datasource_contract/news_source_datasource.dart';
import 'package:news_hub/repository_contract/news_source_repository.dart';

@Injectable(as: NewsSourceRepository)
class NewsSourceRepositoryImpl extends NewsSourceRepository {
  NewsSourceDataSource newsSourceDataSource;
  @factoryMethod
  NewsSourceRepositoryImpl(
      {required this.newsSourceDataSource}); // dependency injection => (the obj from NewsSourceRepositoryImpl in depends on obj from NewsSourceDataSource, in the creation of the obj )
  @override
  Future<List<Source>?> getSources(String categoryId) {
    return newsSourceDataSource.getSources(categoryId);
  }
}
