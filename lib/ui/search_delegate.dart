import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_hub/di/di.dart';

import 'home/news_fragment/news_item_widget.dart';
import 'home/news_fragment/news_list_view_model.dart';

class SearchScreen extends SearchDelegate {
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      Padding(
        padding: const EdgeInsets.only(right: 22),
        child: IconButton(
            onPressed: () {
              showResults(context);
            },
            icon: Icon(Icons.search)),
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15),
      child: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back)),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    NewsListViewModel viewModel = getIt.get<NewsListViewModel>();
    viewModel.loadSearchNews(query);
    return BlocBuilder<NewsListViewModel, NewsListState>(
      bloc: viewModel,
      builder: (context, state) {
        switch (state) {
          case LoadingState():
            return Center(
                child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircularProgressIndicator(
                  color: Colors.green,
                ),
                SizedBox(
                  width: 8,
                ),
                Text(state.message),
              ],
            ));
          case ErrorState():
            return Center(
                child: Column(children: [
              Text(state.errorMessage ?? ''),
              ElevatedButton(
                  onPressed: () {
                    viewModel.loadSearchNews(query);
                  },
                  child: Text('Try Again'))
            ]));
          case SuccessState():
            return Expanded(
              child: ListView.builder(
                itemBuilder: (context, index) =>
                    NewsItemWidget(news: state.newsList![index]),
                itemCount: state.newsList?.length,
              ),
            );
        }
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    NewsListViewModel viewModel = getIt.get<NewsListViewModel>();
    viewModel.loadSearchNews(query);
    return BlocBuilder<NewsListViewModel, NewsListState>(
      bloc: viewModel,
      builder: (context, state) {
        switch (state) {
          case LoadingState():
            return Center(
                child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircularProgressIndicator(
                  color: Colors.green,
                ),
                SizedBox(
                  width: 8,
                ),
                Text(state.message),
              ],
            ));
          case ErrorState():
            return Container();
          case SuccessState():
            return Expanded(
              child: ListView.builder(
                itemBuilder: (context, index) =>
                    NewsItemWidget(news: state.newsList![index]),
                itemCount: state.newsList?.length,
              ),
            );
        }
      },
    );
  }
}
