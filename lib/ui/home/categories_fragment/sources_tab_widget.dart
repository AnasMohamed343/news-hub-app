import 'package:flutter/material.dart';
import 'package:news_hub/ui/home/categories_fragment/tab_item_widget.dart';
import 'package:news_hub/ui/home/news_fragment/news_list_widget.dart';
import '../../../model/source_response/Source.dart';

class SourcesTabWidget extends StatefulWidget {
  List<Source> sources;

  SourcesTabWidget({required this.sources});

  @override
  State<SourcesTabWidget> createState() => _SourcesTabWidgetState();
}

class _SourcesTabWidgetState extends State<SourcesTabWidget> {
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: widget.sources.length,
        child: Column(
          children: [
            TabBar(
              onTap: (newIndex) {
                selectedIndex = newIndex;
                setState(() {});
              },
              indicatorColor: Colors.transparent,
              isScrollable: true,
              tabs: widget.sources
                  .map((source) => TabItemWidget(
                        source: source,
                        isSelected:
                            widget.sources.indexOf(source) == selectedIndex,
                      ))
                  .toList(),
            ),
            NewsListWidget(
                source: widget.sources[
                    selectedIndex]), //write (widget) before sources . because i can't access any thing in StatefulWidget without write (widget)
          ],
        ));
  }
}
