import 'package:flutter/material.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'package:miotech_flutter_demo/widgets/sentiment_bar.dart';
import 'package:miotech_flutter_demo/mio_colors.dart';
import 'package:miotech_flutter_demo/models/narrative.dart';

class NewsScreen extends StatelessWidget {
  NewsScreen(this.narrative);
  Narrative narrative;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(narrative.title),
      ),
      body: Scrollbar(
        child: Scrollbar(
          child: SingleChildScrollView(
            child: SafeArea(
              child: Container(
                padding: EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Text(
                          narrative.eventType,
                          style: TextStyle(color: MioColors.brand),
                        ),
                        SizedBox(width: 16.0),
                        Expanded(
                          child: Text(
                            narrative.source,
                            style: TextStyle(color: MioColors.secondary),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        SizedBox(width: 16.0),
                        Text(
                          timeago.format(DateTime.fromMillisecondsSinceEpoch(
                              int.parse(narrative.timestamp))),
                          style: TextStyle(color: MioColors.secondary),
                        ),
                      ],
                    ),
                    SizedBox(height: 16.0),
                    Text(
                      narrative.title,
                      style: TextStyle(fontSize: 24.0),
                    ),
                    SizedBox(height: 16.0),
                    SentimentBar(narrative: narrative),
                    SizedBox(height: 16.0),
                    Container(
                      color: MioColors.fifth,
                      padding: EdgeInsets.all(16.0),
                      child: Text(
                        narrative.abstract,
                        style: TextStyle(
                          color: MioColors.secondary,
                          fontStyle: FontStyle.italic,
                          height: 1.2,
                          fontSize: 16.0,
                        ),
                      ),
                    ),
                    SizedBox(height: 16.0),
                    Text(
                      narrative.content.replaceAll('<br>', '\n'),
                      style: TextStyle(
                        height: 1.2,
                        fontSize: 16.0,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
