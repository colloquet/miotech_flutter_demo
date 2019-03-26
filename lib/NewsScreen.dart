import 'package:flutter/material.dart';
import 'SentimentBar.dart';

class NewsScreen extends StatelessWidget {
  NewsScreen(this.narrative);

  final narrative;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(narrative['title']),
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Container(
            padding: EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
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
                  height: 16.0,
                ),
                Text(
                  narrative['title'],
                  style: TextStyle(fontSize: 24.0),
                ),
                SizedBox(
                  height: 16.0,
                ),
                new SentimentBar(narrative: narrative),
                SizedBox(
                  height: 16.0,
                ),
                Text(
                  narrative['abstract'],
                  style: TextStyle(color: Color(0xff8ca0b3), fontStyle: FontStyle.italic),
                ),
                SizedBox(
                  height: 16.0,
                ),
                Text(
                  narrative['content'].replaceAll('<br>', '\n'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
