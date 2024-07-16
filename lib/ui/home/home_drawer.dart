import 'package:flutter/material.dart';
import 'package:news_hub/style/myTheme.dart';

typedef OnDrawerItemClicked = void Function(DrawerItem);

class HomeDrawer extends StatelessWidget {
  OnDrawerItemClicked onDrawerItemClicked;
  HomeDrawer({required this.onDrawerItemClicked});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            width: double.infinity,
            height: 110,
            alignment: Alignment.center,
            color: MyThemeData.primaryColor,
            //Theme.of(context).primaryColor,
            child: Text(
              //textAlign: TextAlign.center,
              "News Hub!",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                  color: Colors.white),
            ),
          ),
          InkWell(
            onTap: () {
              onDrawerItemClicked(DrawerItem.categories);
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Icon(
                    Icons.list,
                    size: 28,
                  ),
                  SizedBox(
                    width: 8,
                  ),
                  Text(
                    'Castegories',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w700,
                      color: Colors.black,
                    ),
                  )
                ],
              ),
            ),
          ),
          InkWell(
            onTap: () {
              onDrawerItemClicked(DrawerItem.settings);
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Icon(
                    Icons.settings,
                    size: 28,
                  ),
                  SizedBox(
                    width: 8,
                  ),
                  Text(
                    'Settings',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w700,
                      color: Colors.black,
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

enum DrawerItem {
  categories,
  settings,
}
