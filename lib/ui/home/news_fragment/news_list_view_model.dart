import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_hub/api_manager/api_manager.dart';

import '../../../model/news_response/News.dart';

class NewsListViewModel extends Cubit<NewsListState> {
  NewsListViewModel() : super(LoadingState(message: 'Loading...'));

  void getNews(String sourceId) async {
    // emit(LoadingState(message: 'Loading...'));
    try {
      var response = await ApiManager.getNews(sourceId);
      if (response.status == 'error') {
        emit(ErrorState(errorMessage: response.message));
      } else {
        emit(SuccessState(newsList: response.articles));
      }
    } catch (e) {
      emit(ErrorState(errorMessage: e.toString()));
    }
  }
}

sealed class NewsListState {}

class LoadingState extends NewsListState {
  String message;
  LoadingState({required this.message});
}

class ErrorState extends NewsListState {
  String? errorMessage;
  ErrorState({this.errorMessage});
}

class SuccessState extends NewsListState {
  List<News>? newsList;
  SuccessState({this.newsList});
}
