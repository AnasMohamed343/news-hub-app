import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_hub/api_manager/api_manager.dart';
import 'package:news_hub/model/source_response/Source.dart';
import 'package:news_hub/ui/home/news_fragment/news_item_widget.dart';
import 'package:news_hub/ui/home/news_fragment/news_list_view_model.dart';

class NewsListView extends StatefulWidget {
  Source source;
  NewsListView({required this.source});

  @override
  State<NewsListView> createState() => _NewsListViewState();
}

class _NewsListViewState extends State<NewsListView> {
  NewsListViewModel viewModel = NewsListViewModel();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    viewModel.getNews(widget.source.id!);
  }

  @override
  void didUpdateWidget(covariant NewsListView oldWidget) {
    // her i used didUpdateWidget() after initState(), because initState called one time when project going on to build, but i want the function getNews to called every time i click on source to updated with sourceId, so i used didUpdateWidget().
    // TODO: implement didUpdateWidget
    super.didUpdateWidget(oldWidget);
    viewModel.getNews(widget.source.id!);
  }

  @override
  Widget build(BuildContext context) {
    //calling api
    // return FutureBuilder(
    //   future: ApiManager.getNews(source.id!),
    //   builder: (context, snapshot) {
    //     if (snapshot.connectionState == ConnectionState.waiting) {
    //       return Center(
    //         child: CircularProgressIndicator(),
    //       );
    //     }
    //     if (snapshot.hasError || snapshot.data?.message == 'error') {
    //       return Center(
    //           child: Column(children: [
    //         Text(snapshot.data?.message ?? snapshot.error.toString()),
    //         ElevatedButton(onPressed: () {}, child: Text('Try Again'))
    //       ]));
    //     }
    //     var newsList = snapshot.data?.articles;
    //     return Expanded(
    //       child: ListView.builder(
    //         itemBuilder: (context, index) =>
    //             NewsItemWidget(news: newsList![index]),
    //         itemCount: newsList?.length ?? 0,
    //       ),
    //     );
    //   },
    // );

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
                    viewModel.getNews(widget.source.id!);
                  },
                  child: Text('Try Again'))
            ]));

          case SuccessState():
            return Expanded(
              child: ListView.builder(
                itemBuilder: (context, index) =>
                    NewsItemWidget(news: state.newsList![index]),
                itemCount: state.newsList?.length ?? 0,
              ),
            );
        }
      },
    );
  }
}
