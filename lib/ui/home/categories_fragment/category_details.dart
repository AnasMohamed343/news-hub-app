import 'package:flutter/material.dart';
import 'package:news_hub/api_manager/api_manager.dart';
import 'package:news_hub/ui/component/category_widget.dart';
import 'package:news_hub/ui/home/categories_fragment/sources_tab_widget.dart';

class CategoryDetails extends StatelessWidget {
  CategoryItem categoryItem;
  CategoryDetails({required this.categoryItem});
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: ApiManager.getSources(categoryItem.id),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError || snapshot.data?.message == 'error') {
            return Center(
                child: Column(children: [
              Text(snapshot.data?.message ?? snapshot.error.toString()),
              ElevatedButton(onPressed: () {}, child: Text('Try Again'))
            ]));
          }
          var sourcesList = snapshot.data?.sources;
          return SourcesTabWidget(sources: sourcesList!);
        });
  }
}
