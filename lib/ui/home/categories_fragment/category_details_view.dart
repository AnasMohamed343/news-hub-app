import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_hub/api_manager/api_manager.dart';
import 'package:news_hub/ui/component/category_widget.dart';
import 'package:news_hub/ui/home/categories_fragment/category_details_view_model.dart';
import 'package:news_hub/ui/home/categories_fragment/sources_tab_widget.dart';

class CategoryDetailsView extends StatefulWidget {
  CategoryItem categoryItem;
  CategoryDetailsView({required this.categoryItem});

  @override
  State<CategoryDetailsView> createState() => _CategoryDetailsViewState();
}

class _CategoryDetailsViewState extends State<CategoryDetailsView> {
  CategoryDetailsViewModel viewModel = CategoryDetailsViewModel();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    viewModel.loadSources(widget.categoryItem.id);
  }

  @override
  Widget build(BuildContext context) {
    //calling the api
    // return FutureBuilder(
    //     future: ApiManager.getSources(categoryItem.id),
    //     builder: (context, snapshot) {
    //       if (snapshot.connectionState == ConnectionState.waiting) {
    //         return Center(child: CircularProgressIndicator());
    //       }
    //       if (snapshot.hasError || snapshot.data?.message == 'error') {
    //         return Center(
    //             child: Column(children: [
    //           Text(snapshot.data?.message ?? snapshot.error.toString()),
    //           ElevatedButton(onPressed: () {}, child: Text('Try Again'))
    //         ]));
    //       }
    //       var sourcesList = snapshot.data?.sources;
    //       return SourcesTabWidget(sources: sourcesList!);
    //     });

    return BlocBuilder<CategoryDetailsViewModel, CategoryDetailsState>(
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
                    viewModel.loadSources(widget
                        .categoryItem.id); //to go to call the server again
                  },
                  child: Text('Try Again'))
            ]));

          case SuccessState():
            return SourcesTabWidget(sources: state.sourcesList!);
        }
      },
    );
  }
}
