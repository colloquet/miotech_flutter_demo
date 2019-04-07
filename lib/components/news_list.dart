import 'package:flutter/material.dart';
import 'package:miotech_flutter_demo/components/news_item.dart';
import 'package:miotech_flutter_demo/mio_colors.dart';

class NewsList extends StatelessWidget {
  NewsList({
    Key key,
    this.data,
  }) : super(key: key);
  final data;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      separatorBuilder: (context, index) => Divider(
            height: 1.0,
            color: MioColors.third,
          ),
      itemCount: data == null ? 0 : data.length,
      itemBuilder: (BuildContext context, int index) {
        final _narrative = data[index]['narrative'];

        return NewsItem(narrative: _narrative);
      },
    );
  }
}
