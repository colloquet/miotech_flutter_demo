import 'package:flutter/material.dart';
import 'dart:convert';
import 'NewsItem.dart';

class NewsList extends StatelessWidget {
  const NewsList({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: DefaultAssetBundle.of(context).loadString('assets/news.json'),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }

        var data = json.decode(snapshot.data.toString());
        return ListView.separated(
          separatorBuilder: (context, index) => Divider(
            height: 1.0,
            color: Color(0xff344056),
          ),
          itemCount: data == null ? 0 : data.length,
          itemBuilder: (BuildContext context, int index) {
            var narrative = data[index]['narrative'];

            return NewsItem(narrative: narrative);
          },
        );
      },
    );
  }
}