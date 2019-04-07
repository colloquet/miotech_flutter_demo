import 'package:flutter/material.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'package:miotech_flutter_demo/screens/news_screen.dart';
import 'package:miotech_flutter_demo/components/sentiment_bar.dart';
import 'package:miotech_flutter_demo/mio_colors.dart';

class NewsItem extends StatelessWidget {
  NewsItem({
    Key key,
    @required this.narrative,
  }) : super(key: key);

  final narrative;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => NewsScreen(narrative)),
        );
      },
      child: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Row(
              children: <Widget>[
                Text(
                  narrative['eventType'],
                  style: TextStyle(color: MioColors.brand),
                ),
                SizedBox(width: 16.0),
                Expanded(
                  child: Text(
                    narrative['source'],
                    style: TextStyle(color: MioColors.secondary),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                SizedBox(width: 16.0),
                Text(
                  timeago.format(
                    DateTime.fromMillisecondsSinceEpoch(
                      int.parse(narrative['timestamp']),
                    ),
                  ),
                  style: TextStyle(color: MioColors.secondary),
                ),
              ],
            ),
            SizedBox(height: 8.0),
            Text(
              narrative['title'],
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(fontSize: 18.0),
            ),
            SizedBox(height: 8.0),
            Text(
              narrative['abstract'].replaceAll('\n', ' '),
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(color: MioColors.secondary.withOpacity(0.6)),
            ),
            SizedBox(height: 8.0),
            SentimentBar(narrative: narrative),
          ],
        ),
      ),
    );
  }
}
