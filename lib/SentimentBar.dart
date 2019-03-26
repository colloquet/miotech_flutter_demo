import 'package:flutter/material.dart';

class SentimentBar extends StatelessWidget {
  const SentimentBar({
    Key key,
    @required this.narrative,
  }) : super(key: key);

  final narrative;

  @override
  Widget build(BuildContext context) {
    var backgroundColor =
        narrative['sentimentScore'] < 0 ? Color(0x66ff6336) : Color(0x669ac646);
    var borderColor =
        narrative['sentimentScore'] < 0 ? Color(0xffff6336) : Color(0xff9ac646);
    return Row(
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
                  color: backgroundColor,
                  borderRadius: BorderRadius.all(
                    Radius.circular(2.0),
                  ),
                  border: Border.all(color: borderColor),
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          width: 8.0,
        ),
        Text(narrative['sentimentScore'].toStringAsFixed(2).toString(),
            style: TextStyle(color: borderColor)),
      ],
    );
  }
}
