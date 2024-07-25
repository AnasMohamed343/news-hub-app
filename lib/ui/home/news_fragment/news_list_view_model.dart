import 'dart:ffi';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:news_hub/data/datasource_impl/news_datasource_impl.dart';
import 'package:news_hub/data/repository_impl/news_repository_impl.dart';

import '../../../data/api/api_manager.dart';
import '../../../data/api/model/news_response/News.dart';
import '../../../data/datasource_contract/news_datasource.dart';
import '../../../repository_contract/news_repository.dart';

@injectable
class NewsListViewModel extends Cubit<NewsListState> {
  late NewsRepository newsRepository;
  @factoryMethod
  NewsListViewModel({required this.newsRepository})
      : super(LoadingState(message: 'Loading...'));

  void getNews(String sourceId, int page) async {
    // emit(LoadingState(message: 'Loading...'));
    try {
      var articles = await newsRepository.getNews(sourceId, page);
      emit(SuccessState(newsList: articles));
      // if (response.status == 'error') {
      //   emit(ErrorState(errorMessage: response.message));
      // } else {
      //   emit(SuccessState(newsList: response.articles));
      // }
    } catch (e) {
      emit(ErrorState(errorMessage: e.toString()));
    }
  }

  void loadSearchNews(String query) async {
    // emit(LoadingState(message: 'Loading...'));
    try {
      var articles = await newsRepository.getSearchNews(query);
      emit(SuccessState(newsList: articles));
      // if (response.status == 'error') {
      //   emit(ErrorState(errorMessage: response.message));
      // } else {
      //   emit(SuccessState(newsList: response.articles));
      // }
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
