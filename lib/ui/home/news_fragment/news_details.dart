import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../data/api/model/news_response/News.dart';

class NewsDetails extends StatelessWidget {
  static const String routeName = 'News Details';
  @override
  Widget build(BuildContext context) {
    var news = ModalRoute.of(context)?.settings.arguments as News;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(news.author ?? ''),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment
              .stretch, //stretch => all of the element well be in the start
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.network(
                news.urlToImage ?? 'https://via.placeholder.com/150',
                errorBuilder: (context, error, stackTrace) =>
                    const Icon(Icons.error),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              news.title ?? 'No title',
              style: TextStyle(fontSize: 11, color: Colors.black54),
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              news.description ?? 'No Description',
              style: TextStyle(fontSize: 14, color: Color(0xff383f46)),
            ),
            SizedBox(
              height: 6,
            ),
            Text(
              news.author ?? 'Unknown Author',
              textAlign: TextAlign.end,
              style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  color: Color(0xff42505C)),
            ),
            Text(
              formatDate(news.publishedAt ?? 'No Date'),
              textAlign: TextAlign.start,
              style: TextStyle(fontSize: 12, color: Color(0xff79828B)),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              height: height * 0.1,
              child: ListView(
                children: [
                  Container(
                    //height: height * 0.3,
                    child: Text(
                      news.content ?? '',
                      style: TextStyle(fontSize: 14, color: Color(0xff383f46)),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: height * 0.1,
            ),
            InkWell(
              onTap: () {
                _launchUrl(news.url ?? '');
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text("View Full Article"),
                  Icon(Icons.arrow_right_sharp),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _launchUrl(String url) async {
    Uri _uri = Uri.parse(url);
    if (!await launchUrl(_uri)) {
      throw Exception('Could not launch $_uri');
    }
  }

  String formatDate(String dateString) {
    DateTime dateTime = DateTime.parse(dateString);
    return DateFormat('yyyy-MM-dd')
        .format(dateTime); // Change the format as needed
  }
}
