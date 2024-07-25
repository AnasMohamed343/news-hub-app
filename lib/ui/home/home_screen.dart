import 'package:flutter/material.dart';
import 'package:news_hub/ui/component/category_widget.dart';
import 'package:news_hub/ui/home/categories_fragment/categories_fragment.dart';
import 'package:news_hub/ui/home/categories_fragment/category_details_view.dart';
import 'package:news_hub/ui/home/home_drawer.dart';
import 'package:news_hub/ui/home/settings_fragment/settings_fragment.dart';
import 'package:news_hub/ui/search_delegate.dart';

class HomeScreen extends StatefulWidget {
  static const String routName = 'Home Screen';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    selectedWidget = CategoriesFragment(
      onCategoryItemClicked: onCategoryItemClicked,
    );
  }

  Widget build(BuildContext context) {
    return Container(
      //color: Colors.white,
      decoration: BoxDecoration(
          color: Colors.white,
          image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage("assets/images/bg_app.png"))),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 18),
              child: IconButton(
                  onPressed: () {
                    showSearch(context: context, delegate: SearchScreen());
                  },
                  icon: Icon(
                    Icons.search,
                    size: 30,
                  )),
            )
          ],
          title: Text(
            'News Hub',
          ),
        ),
        drawer: HomeDrawer(
          onDrawerItemClicked: onDrawerItemClicked,
        ),
        body: selectedWidget,
      ),
    );
  }

  late Widget selectedWidget;

  void onDrawerItemClicked(DrawerItem item) {
    switch (item) {
      case DrawerItem.categories:
        {
          selectedWidget = CategoriesFragment(
            onCategoryItemClicked: onCategoryItemClicked,
          );
        }
      case DrawerItem.settings:
        {
          selectedWidget = SettingsFragment();
        }
    }
    Navigator.pop(context); //to close the drawer after choosing widget from it
    setState(() {});
  }

  void onCategoryItemClicked(CategoryItem categoryItem) {
    selectedWidget = CategoryDetailsView(
      categoryItem: categoryItem,
    );
    setState(() {});
  }
}
