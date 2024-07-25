import 'package:flutter/material.dart';
import 'package:news_hub/di/di.dart';
import 'package:news_hub/style/myTheme.dart';
import 'package:news_hub/ui/home/home_screen.dart';
import 'package:news_hub/ui/home/news_fragment/news_details.dart';

void main() {
  configureDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: MyThemeData.appTheme,
      routes: {
        HomeScreen.routName: (_) => HomeScreen(),
        NewsDetails.routeName: (_) => NewsDetails(),
      },
      initialRoute: HomeScreen.routName,
    );
  }
}
