import 'package:flutter/material.dart';

class CategoryWidget extends StatelessWidget {
  CategoryItem categoryItem;
  int index;
  CategoryWidget({required this.categoryItem, required this.index});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: categoryItem.bgColor,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(25),
            topRight: Radius.circular(25),
            bottomLeft: Radius.circular(index.isEven ? 25 : 0),
            bottomRight: Radius.circular(index.isEven ? 0 : 25),
          )),
      child: Column(
        children: [
          Image.asset(
            categoryItem.imagePath,
            width: 132,
            height: 116,
          ),
          Text(
            categoryItem.title,
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.w400,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}

class CategoryItem {
  String id;
  String title;
  String imagePath;
  Color bgColor;
  CategoryItem(
      {required this.id,
      required this.title,
      required this.bgColor,
      required this.imagePath});

  static List<CategoryItem> getCategoryList() {
    return [
      CategoryItem(
          id: 'sports',
          title: 'Sports',
          bgColor: Color(0xffC91C22),
          imagePath: 'assets/images/sportssports1x.png'),
      CategoryItem(
          id: 'general',
          title: 'General',
          bgColor: Color(0xff003E90),
          imagePath: 'assets/images/Politicspolitics.png'),
      CategoryItem(
          id: 'health',
          title: 'Health',
          bgColor: Color(0xffED1E79),
          imagePath: 'assets/images/healthhealth.png'),
      CategoryItem(
          id: 'business',
          title: 'Business',
          bgColor: Color(0xffCF7E48),
          imagePath: 'assets/images/bussinesbessines.png'),
      CategoryItem(
          id: 'technology',
          title: 'Technology',
          bgColor: Color(0xff4882CF),
          imagePath: 'assets/images/environmentenv.png'),
      CategoryItem(
          id: 'science',
          title: 'Science',
          bgColor: Colors.amber,
          imagePath: 'assets/images/sciencescince.png'),
      CategoryItem(
          id: 'entertainment',
          title: 'Entertainment',
          bgColor: Colors.green,
          imagePath: 'assets/images/environmentenv.png'),
    ];
  }
}
