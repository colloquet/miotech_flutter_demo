import 'package:flutter/material.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'package:miotech_flutter_demo/narrative/sentiment_bar.dart';
import 'package:miotech_flutter_demo/mio_colors.dart';
import 'package:miotech_flutter_demo/models/narrative.dart';

class NarrativeScreen extends StatelessWidget {
  const NarrativeScreen(this.narrative);
  final Narrative narrative;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(narrative.title),
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Container(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Text(
                      narrative.eventType,
                      style: TextStyle(color: MioColors.brand),
                    ),
                    const SizedBox(width: 16.0),
                    Expanded(
                      child: Text(
                        narrative.source,
                        style: TextStyle(color: MioColors.secondary),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    const SizedBox(width: 16.0),
                    Text(
                      timeago.format(DateTime.fromMillisecondsSinceEpoch(
                          int.parse(narrative.timestamp))),
                      style: TextStyle(color: MioColors.secondary),
                    ),
                  ],
                ),
                const SizedBox(height: 16.0),
                Text(
                  narrative.title,
                  style: TextStyle(fontSize: 24.0),
                ),
                const SizedBox(height: 16.0),
                SentimentBar(narrative: narrative),
                const SizedBox(height: 16.0),
                Container(
                  color: MioColors.fifth,
                  padding: const EdgeInsets.all(16.0),
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
                const SizedBox(height: 16.0),
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
    );
  }
}
