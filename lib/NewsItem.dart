import 'package:flutter/material.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'NewsScreen.dart';
import 'SentimentBar.dart';

class NewsItem extends StatelessWidget {
  const NewsItem({
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
                  style: TextStyle(color: Color(0xffcfb162)),
                ),
                SizedBox(width: 16.0),
                Expanded(
                  child: Text(
                    narrative['source'],
                    style: TextStyle(color: Color(0xff8ca0b3)),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                SizedBox(width: 16.0),
                Text(
                  timeago.format(DateTime.fromMillisecondsSinceEpoch(int.parse(narrative['timestamp']))),
                  style: TextStyle(color: Color(0xff8ca0b3)),
                ),
              ],
            ),
            SizedBox(
              height: 8.0,
            ),
            Text(
              narrative['title'],
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(fontSize: 18.0),
            ),
            SizedBox(
              height: 8.0,
            ),
            Text(
              narrative['abstract'].replaceAll('\n', ' '),
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(color: Color(0x998ca0b3)),
            ),
            SizedBox(
              height: 8.0,
            ),
            SentimentBar(narrative: narrative),
          ],
        ),
      ),
    );
  }
}
