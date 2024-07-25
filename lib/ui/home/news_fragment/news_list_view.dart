import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_hub/di/di.dart';
import 'package:news_hub/ui/home/news_fragment/news_item_widget.dart';
import 'package:news_hub/ui/home/news_fragment/news_list_view_model.dart';

import '../../../data/api/model/source_response/Source.dart';

class NewsListView extends StatefulWidget {
  Source source;
  NewsListView({required this.source});

  @override
  State<NewsListView> createState() => _NewsListViewState();
}

class _NewsListViewState extends State<NewsListView> {
  int page = 1;
  NewsListViewModel viewModel = getIt.get<NewsListViewModel>();
  late ScrollController controller = ScrollController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //pagination//
    controller.addListener(() {
      if (controller.position.atEdge) {
        if (controller.offset != 0) {
          setState(() {
            page++;
            //controller.jumpTo(0);
          });
        }
      }
    });
    /////
    viewModel.getNews(widget.source.id ?? '', page);
  }

  @override
  void didUpdateWidget(covariant NewsListView oldWidget) {
    // her i used didUpdateWidget() after initState(), because initState called one time when project going on to build, but i want the function getNews to called every time i click on source to updated with sourceId, so i used didUpdateWidget().
    // TODO: implement didUpdateWidget
    super.didUpdateWidget(oldWidget);
    //pagination//
    controller.addListener(() {
      if (controller.position.atEdge) {
        if (controller.offset != 0) {
          setState(() {
            page++;
            //controller.jumpTo(0);
          });
        }
      }
    });
    /////
    //viewModel.getNews(widget.source.id ?? '', page);
  }

  @override
  Widget build(BuildContext context) {
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
                    viewModel.getNews(widget.source.id ?? '', page);
                  },
                  child: Text('Try Again'))
            ]));
          case SuccessState():
            return Expanded(
              child: ListView.builder(
                controller: controller,
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
