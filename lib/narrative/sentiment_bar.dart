import 'package:flutter/material.dart';
import 'package:miotech_flutter_demo/mio_colors.dart';
import 'package:miotech_flutter_demo/models/narrative.dart';

class SentimentBar extends StatelessWidget {
  SentimentBar({
    Key key,
    @required this.narrative,
  }) : super(key: key);
  final Narrative narrative;
  final double _width = 76.0;

  @override
  Widget build(BuildContext context) {
    final _backgroundColor = narrative.sentimentScore >= 0
        ? MioColors.green.withOpacity(0.4)
        : MioColors.orange.withOpacity(0.4);
    final _borderColor =
        narrative.sentimentScore >= 0 ? MioColors.green : MioColors.orange;
    return Row(
      children: <Widget>[
        Text(
          'Sentiment',
          style: TextStyle(color: MioColors.secondary),
        ),
        SizedBox(width: 8.0),
        Container(
          height: 10.0,
          width: _width,
          decoration: BoxDecoration(
            color: MioColors.fourth,
            borderRadius: BorderRadius.circular(2.0),
          ),
          child: Row(
            children: <Widget>[
              Container(
                height: 10.0,
                width: narrative.sentimentScore.abs() * _width,
                decoration: BoxDecoration(
                  color: _backgroundColor,
                  borderRadius: BorderRadius.circular(2.0),
                  border: Border.all(color: _borderColor),
                ),
              ),
            ],
          ),
        ),
        SizedBox(width: 8.0),
        Text(
          narrative.sentimentScore.toStringAsFixed(2).toString(),
          style: TextStyle(color: _borderColor),
        ),
      ],
    );
  }
}
