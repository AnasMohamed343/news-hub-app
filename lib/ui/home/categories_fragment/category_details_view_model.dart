import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:news_hub/data/datasource_impl/news_source_datasource_impl.dart';
import 'package:news_hub/data/repository_impl/news_source_repository_impl.dart';

import '../../../data/api/api_manager.dart';
import '../../../data/api/model/source_response/Source.dart';
import '../../../data/datasource_contract/news_source_datasource.dart';
import '../../../repository_contract/news_source_repository.dart';

@injectable // because i want object from this class himself,,, he didn't have a parent class
class CategoryDetailsViewModel extends Cubit<CategoryDetailsState> {
  late NewsSourceRepository newsSourceRepository;
  @factoryMethod //=> resolve the dependencies and return the obj of the class
  CategoryDetailsViewModel({required this.newsSourceRepository})
      : super(LoadingState(message: 'Loading...'));

  void loadSources(String categoryId) async {
    try {
      var sourcesList = await newsSourceRepository.getSources(categoryId);
      emit(SuccessState(sourcesList: sourcesList));
      // if (response.status == 'error') {
      //   emit(ErrorState(errorMessage: response.message));
      // } else {
      //   emit(SuccessState(sourcesList: response.sources));
      // }
    } catch (e) {
      emit(ErrorState(errorMessage: e.toString()));
    }
  }
}

sealed class CategoryDetailsState {} // make the class sealed instead of abstract => to make the states to be only the states in this class (only)

class LoadingState extends CategoryDetailsState {
  String message;
  LoadingState({required this.message});
}

class SuccessState extends CategoryDetailsState {
  List<Source>? sourcesList;
  SuccessState({required this.sourcesList});
}

class ErrorState extends CategoryDetailsState {
  String? errorMessage;
  ErrorState({this.errorMessage});
}
