import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:miotech_flutter_demo/scoped_models/main.dart';
import 'package:miotech_flutter_demo/components/news_item.dart';
import 'package:miotech_flutter_demo/mio_colors.dart';

class NewsList extends StatelessWidget {
  NewsList({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant<MainModel>(
      builder: (BuildContext context, Widget child, MainModel model) {
        return ListView.separated(
          separatorBuilder: (context, index) => Divider(
                height: 1.0,
                color: MioColors.third,
              ),
          itemCount: model.newsData == null ? 0 : model.newsData.length,
          itemBuilder: (BuildContext context, int index) {
            final _narrative = model.newsData[index]['narrative'];

            return NewsItem(narrative: _narrative);
          },
        );
      },
    );
  }
}
