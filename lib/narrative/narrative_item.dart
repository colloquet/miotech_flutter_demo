import 'package:flutter/material.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'package:miotech_flutter_demo/narrative/narrative_screen.dart';
import 'package:miotech_flutter_demo/narrative/sentiment_bar.dart';
import 'package:miotech_flutter_demo/mio_colors.dart';
import 'package:miotech_flutter_demo/models/narrative.dart';

class NarrativeItem extends StatelessWidget {
  NarrativeItem({
    Key key,
    @required this.narrative,
  }) : super(key: key);

  final Narrative narrative;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute<dynamic>(builder: (BuildContext context) => NarrativeScreen(narrative)),
        );
      },
      child: Container(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
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
                  timeago.format(
                    DateTime.fromMillisecondsSinceEpoch(
                      int.parse(narrative.timestamp),
                    ),
                  ),
                  style: TextStyle(color: MioColors.secondary),
                ),
              ],
            ),
            const SizedBox(height: 8.0),
            Text(
              narrative.title,
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(fontSize: 18.0),
            ),
            const SizedBox(height: 8.0),
            Text(
              narrative.abstract.replaceAll('\n', ' '),
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(color: MioColors.secondary.withOpacity(0.6)),
            ),
            const SizedBox(height: 8.0),
            SentimentBar(narrative: narrative),
          ],
        ),
      ),
    );
  }
}
