import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../../component/category_widget.dart';

typedef OnCategoryItemClicked = void Function(CategoryItem);

class CategoriesFragment extends StatelessWidget {
  OnCategoryItemClicked onCategoryItemClicked;
  CategoriesFragment({required this.onCategoryItemClicked});
  List<CategoryItem> categoryList = CategoryItem.getCategoryList();
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 35, vertical: 36),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            //textAlign: TextAlign.start,
            'Pick Your Category \n of Interest',
            style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w700,
                color: Color(0xff4F5A69)),
          ),
          Expanded(
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, crossAxisSpacing: 20, mainAxisSpacing: 16),
              itemBuilder: (context, index) => InkWell(
                onTap: () {
                  onCategoryItemClicked(categoryList[index]);
                },
                child: CategoryWidget(
                    categoryItem: categoryList[index], index: index),
              ),
              itemCount: categoryList.length,
            ),
          )
        ],
      ),
    );
  }
}
