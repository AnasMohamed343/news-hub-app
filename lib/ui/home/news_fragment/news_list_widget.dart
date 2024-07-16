import 'package:flutter/material.dart';
import 'package:news_hub/api_manager/api_manager.dart';
import 'package:news_hub/model/source_response/Source.dart';
import 'package:news_hub/ui/home/news_fragment/news_item_widget.dart';

class NewsListWidget extends StatelessWidget {
  Source source;
  NewsListWidget({required this.source});
  @override
  Widget build(BuildContext context) {
    //calling api
    return FutureBuilder(
      future: ApiManager.getNews(source.id!),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
        if (snapshot.hasError || snapshot.data?.message == 'error') {
          return Center(
              child: Column(children: [
            Text(snapshot.data?.message ?? snapshot.error.toString()),
            ElevatedButton(onPressed: () {}, child: Text('Try Again'))
          ]));
        }
        var newsList = snapshot.data?.articles;
        return Expanded(
          child: ListView.builder(
            itemBuilder: (context, index) =>
                NewsItemWidget(news: newsList![index]),
            itemCount: newsList?.length ?? 0,
          ),
        );
      },
    );
  }
}
