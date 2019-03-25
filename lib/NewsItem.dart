import 'package:flutter/material.dart';

class NewsItem extends StatelessWidget {
  const NewsItem({
    Key key,
    @required this.narrative,
  }) : super(key: key);

  final narrative;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
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
                SizedBox(
                  width: 16.0,
                ),
                Flexible(
                  child: Text(
                    narrative['source'],
                    style: TextStyle(color: Color(0xff8ca0b3)),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 8.0,
            ),
            Text(
              narrative['title'],
              style: TextStyle(fontSize: 18.0),
            ),
            SizedBox(
              height: 8.0,
            ),
            Text(
              narrative['abstract'],
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(color: Color(0x998ca0b3)),
            ),
            SizedBox(
              height: 8.0,
            ),
            Row(
              children: <Widget>[
                Text(
                  'Sentiment',
                  style: TextStyle(color: Color(0xff8ca0b3)),
                ),
                SizedBox(
                  width: 8.0,
                ),
                Container(
                  height: 10.0,
                  width: 76.0,
                  decoration: BoxDecoration(
                    color: Color(0xff2d3446),
                    borderRadius: BorderRadius.all(
                      Radius.circular(2.0),
                    ),
                  ),
                  child: Row(
                    children: <Widget>[
                      Container(
                        height: 10.0,
                        width: narrative['sentimentScore'].abs() * 76.0,
                        decoration: BoxDecoration(
                          color: narrative['sentimentScore'] < 0
                              ? Color(0x66ff6336)
                              : Color(0x669ac646),
                          borderRadius: BorderRadius.all(
                            Radius.circular(2.0),
                          ),
                          border: Border.all(
                              color: narrative['sentimentScore'] < 0
                                  ? Color(0xffff6336)
                                  : Color(0xff9ac646)),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}