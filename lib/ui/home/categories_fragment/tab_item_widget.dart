import 'package:flutter/material.dart';

import '../../../data/api/model/source_response/Source.dart';

class TabItemWidget extends StatelessWidget {
  Source source;
  bool isSelected;
  TabItemWidget({required this.source, required this.isSelected});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 8, horizontal: 18),
      margin: EdgeInsets.all(8),
      decoration: BoxDecoration(
          color: isSelected ? Colors.green : Colors.transparent,
          borderRadius: BorderRadius.circular(26),
          border: Border.all(color: Colors.green, width: 2)),
      child: Text(
        source.name!,
        style: TextStyle(color: isSelected ? Colors.white : Colors.green),
      ),
    );
  }
}
