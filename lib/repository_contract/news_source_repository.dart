// interface => abstract class but can only contain abstract methods
// abstract class => can contain abstract method and concrete methods

import '../data/api/model/source_response/Source.dart';

abstract class NewsSourceRepository {
  Future<List<Source>?> getSources(String categoryId);
}
