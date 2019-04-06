import 'package:flutter/material.dart';
import 'package:miotech_flutter_demo/colors.dart';

class EarningHistoryTable extends StatelessWidget {
  const EarningHistoryTable({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Table(
        defaultColumnWidth: FixedColumnWidth(100.0),
        children: [
          TableRow(
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(
                    color: MioColors.fourth, width: 1),
              ),
            ),
            children: [
              Cell(
                text: 'Event Type',
                isHeader: true,
              ),
              Cell(
                text: 'No. of Events',
                right: true,
                isHeader: true,
              ),
              Cell(
                text: 'Most Recent',
                right: true,
                isHeader: true,
              ),
              Cell(
                text: 'Avg. % Return on Day of Event',
                right: true,
                isHeader: true,
              ),
              Cell(
                text: 'Avg. Excess Return on Day of Event',
                right: true,
                isHeader: true,
              ),
              Cell(
                text: '% Return 5 Days before Event',
                right: true,
                isHeader: true,
              ),
              Cell(
                text: '% Return 5 Days after Event',
                right: true,
                isHeader: true,
              ),
              Cell(
                text: '% Day of Events Positive',
                right: true,
                isHeader: true,
              ),
              Cell(
                text: 'P Value',
                right: true,
                isHeader: true,
              ),
            ],
          ),
          TableRow(
            decoration: BoxDecoration(
              color: MioColors.background,
            ),
            children: [
              Cell(
                  text:
                      'Earnings Significantly Beat Consensus'),
              Cell(text: '2', right: true),
              Cell(text: '2013-10-29', right: true),
              Cell(
                text: '-0.49%',
                right: true,
                background: Color(0xff553030),
                fill: true,
              ),
              Cell(
                text: '-0.55%',
                right: true,
                background: Color(0xff5d3330),
                fill: true,
              ),
              Cell(
                text: '0.12%',
                right: true,
                background: Color(0xff19202d),
                fill: true,
              ),
              Cell(
                text: '1.87%',
                right: true,
                background: Color(0xff344333),
                fill: true,
              ),
              Cell(text: '50%', right: true),
              Cell(text: '-', right: true),
            ],
          ),
          TableRow(
            decoration: BoxDecoration(
              color: MioColors.base,
            ),
            children: [
              Cell(text: 'Earnings Beat Consensus'),
              Cell(text: '7', right: true),
              Cell(text: '2018-11-02', right: true),
              Cell(
                text: '0.87%',
                right: true,
                background: Color(0xff3e5035),
                fill: true,
              ),
              Cell(
                text: '0.73%',
                right: true,
                background: Color(0xff384834),
                fill: true,
              ),
              Cell(
                text: '0.10%',
                right: true,
                background: Color(0xff19202d),
                fill: true,
              ),
              Cell(
                text: '2.54%',
                right: true,
                background: Color(0xff3e5035),
                fill: true,
              ),
              Cell(text: '85.71%', right: true),
              Cell(text: '0.41', right: true),
            ],
          ),
          TableRow(
            decoration: BoxDecoration(
              color: MioColors.background,
            ),
            children: [
              Cell(text: 'Earnings Equal Consensus'),
              Cell(text: '1', right: true),
              Cell(text: '2018-02-02', right: true),
              Cell(
                text: '0.21%',
                right: true,
                background: Color(0xff202a2f),
                fill: true,
              ),
              Cell(
                text: '0.21%',
                right: true,
                background: Color(0xff202a2f),
                fill: true,
              ),
              Cell(
                text: '-2.38%',
                right: true,
                background: Color(0xff492d2f),
                fill: true,
              ),
              Cell(
                text: '-3.33%',
                right: true,
                background: Color(0xff5d3330),
                fill: true,
              ),
              Cell(text: '100.00%', right: true),
              Cell(text: '-', right: true),
            ],
          ),
          TableRow(
            decoration: BoxDecoration(
              color: MioColors.base,
            ),
            children: [
              Cell(text: 'Earnings Miss Consensus'),
              Cell(text: '0', right: true),
              Cell(text: '-', right: true),
              Cell(text: '-', right: true),
              Cell(text: '-', right: true),
              Cell(text: '-', right: true),
              Cell(text: '-', right: true),
              Cell(text: '-', right: true),
              Cell(text: '-', right: true),
            ],
          ),
          TableRow(
            decoration: BoxDecoration(
              color: MioColors.background,
            ),
            children: [
              Cell(
                  text:
                      'Earnings Significantly Miss Consensus'),
              Cell(text: '0', right: true),
              Cell(text: '-', right: true),
              Cell(text: '-', right: true),
              Cell(text: '-', right: true),
              Cell(text: '-', right: true),
              Cell(text: '-', right: true),
              Cell(text: '-', right: true),
              Cell(text: '-', right: true),
            ],
          ),
        ],
      ),
    );
  }
}

class Cell extends StatelessWidget {
  const Cell({
    Key key,
    this.text,
    this.right = false,
    this.isHeader = false,
    this.fill = false,
    this.background = Colors.transparent,
  }) : super(key: key);

  final text;
  final right;
  final isHeader;
  final background;
  final fill;

  @override
  Widget build(BuildContext context) {
    final _verticalAlignment = isHeader
        ? TableCellVerticalAlignment.bottom
        : fill
            ? TableCellVerticalAlignment.fill
            : TableCellVerticalAlignment.middle;
    return TableCell(
      child: Container(
        color: background,
        padding: EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment:
              right ? CrossAxisAlignment.end : CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              text,
              textAlign: right ? TextAlign.right : TextAlign.left,
              style: TextStyle(
                color: isHeader ? MioColors.secondary : MioColors.primary,
                fontSize: 12.0,
              ),
            ),
          ],
        ),
      ),
      verticalAlignment: _verticalAlignment,
    );
  }
}
