import '../api/model/source_response/Source.dart';

abstract class NewsSourceDataSource {
  Future<List<Source>?> getSources(String categoryId);
}
