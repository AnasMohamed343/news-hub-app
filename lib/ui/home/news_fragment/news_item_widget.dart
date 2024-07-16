import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'package:news_hub/model/news_response/News.dart';

class NewsItemWidget extends StatelessWidget {
  News news;
  NewsItemWidget({required this.news});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(15),
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
        ],
      ),
    );
  }

  String formatDate(String dateString) {
    DateTime dateTime = DateTime.parse(dateString);
    return DateFormat('yyyy-MM-dd')
        .format(dateTime); // Change the format as needed
  }
}
