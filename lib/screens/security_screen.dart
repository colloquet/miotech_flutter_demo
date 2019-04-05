import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:miotech_flutter_demo/colors.dart';
import 'package:intl/intl.dart';

class StackedAreaCustomColorLineChart extends StatelessWidget {
  final List<charts.Series> seriesList;
  final bool animate;

  StackedAreaCustomColorLineChart(this.seriesList, {this.animate});

  /// Creates a [LineChart] with sample data and no transition.
  factory StackedAreaCustomColorLineChart.withSampleData() {
    return StackedAreaCustomColorLineChart(
      _createSampleData(),
      // Disable animations for image tests.
      animate: false,
    );
  }

  @override
  Widget build(BuildContext context) {
    return charts.TimeSeriesChart(
      seriesList,
      defaultRenderer: charts.LineRendererConfig(includeArea: true),
      animate: animate,
      layoutConfig: charts.LayoutConfig(
        leftMarginSpec: charts.MarginSpec.fixedPixel(20),
        rightMarginSpec: charts.MarginSpec.fixedPixel(0),
        topMarginSpec: charts.MarginSpec.fixedPixel(20),
        bottomMarginSpec: charts.MarginSpec.fixedPixel(20),
      ),
      domainAxis: charts.DateTimeAxisSpec(
        renderSpec: charts.SmallTickRendererSpec(
          labelStyle: charts.TextStyleSpec(
            color: charts.ColorUtil.fromDartColor(MioColors.secondary),
          ),
        ),
      ),
      primaryMeasureAxis: charts.NumericAxisSpec(
        renderSpec: charts.GridlineRendererSpec(
          labelStyle: charts.TextStyleSpec(
            color: charts.ColorUtil.fromDartColor(MioColors.secondary),
          ),
          lineStyle: charts.LineStyleSpec(
            color: charts.MaterialPalette.transparent,
          ),
        ),
      ),
    );
  }

  /// Create one series with sample hard coded data.
  static List<charts.Series<PriceData, DateTime>> _createSampleData() {
    final myFakeDesktopData = [
      PriceData(new DateTime(2015, 1, 1), 1),
      PriceData(new DateTime(2015, 7, 1), 3),
      PriceData(new DateTime(2016, 1, 1), 10),
      PriceData(new DateTime(2016, 7, 1), 8),
      PriceData(new DateTime(2017, 1, 1), 9),
      PriceData(new DateTime(2017, 7, 1), 5),
      PriceData(new DateTime(2018, 1, 1), 7),
      PriceData(new DateTime(2018, 7, 1), 8),
      PriceData(new DateTime(2019, 1, 1), 6),
      PriceData(new DateTime(2019, 7, 1), 4),
    ];

    return [
      charts.Series<PriceData, DateTime>(
        id: 'Desktop',
        // colorFn specifies that the line will be blue.
        colorFn: (_, __) => charts.ColorUtil.fromDartColor(MioColors.brand),
        // areaColorFn specifies that the area skirt will be light blue.
        // areaColorFn: (_, __) =>
        // charts.MaterialPalette.blue.shadeDefault.lighter,
        domainFn: (PriceData data, _) => data.time,
        measureFn: (PriceData data, _) => data.value,
        data: myFakeDesktopData,
      ),
    ];
  }
}

/// Sample linear data type.
class PriceData {
  final DateTime time;
  final int value;

  PriceData(this.time, this.value);
}

class SecurityScreen extends StatelessWidget {
  SecurityScreen(this.security);

  final security;
  final formatter = new DateFormat('yyyy-MM-dd HH:mm:ss');

  @override
  Widget build(BuildContext context) {
    final _ticker = security['assetIDGroup']['ticker'];
    final _name = security['assetIDGroup']['name'];
    final String _lastUpdateTime =
        security['equityAsset']['equityTradingQuote']['lastUpdateTime'];
    final _currentPrice = security['currenctPrice']['adjustedPrice'];
    final _changeFromPreviousClose = security['equityAsset']
        ['equityTradingQuote']['changeFromPreviousClose'];
    final _percentChangeFromPreviousClose = security['equityAsset']
        ['equityTradingQuote']['percentChangeFromPreviousClose'];
    final _previousClose =
        security['equityAsset']['equityTradingQuote']['previousClose'];
    final _open = security['equityAsset']['equityTradingQuote']['open'];
    final _high = security['equityAsset']['equityTradingQuote']['high'];
    final _low = security['equityAsset']['equityTradingQuote']['low'];
    final _displayPercentageChange =
        (_percentChangeFromPreviousClose * 100).toStringAsFixed(2).toString();
    final _isPositive = _changeFromPreviousClose >= 0;
    final _textColor = _isPositive ? MioColors.green : MioColors.orange;

    return Scaffold(
      appBar: AppBar(
        title: Text(_ticker),
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: <Widget>[
              SizedBox(height: 8.0),
              Container(
                color: MioColors.fifth,
                padding: EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      _name,
                      style: TextStyle(fontSize: 18.0),
                    ),
                    SizedBox(height: 8.0),
                    Text(
                      formatter.format(DateTime.fromMillisecondsSinceEpoch(
                          int.parse(_lastUpdateTime))),
                      style: TextStyle(color: MioColors.secondary),
                    ),
                    SizedBox(height: 8.0),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: <Widget>[
                        Expanded(
                          child: Column(
                            children: <Widget>[
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.baseline,
                                textBaseline: TextBaseline.alphabetic,
                                children: <Widget>[
                                  Text(security['currency']),
                                  SizedBox(width: 4.0),
                                  Text(
                                    _currentPrice.toString(),
                                    style: TextStyle(fontSize: 24.0),
                                  ),
                                ],
                              ),
                              SizedBox(height: 4.0),
                              Row(
                                children: <Widget>[
                                  Text(
                                    _changeFromPreviousClose
                                        .toStringAsFixed(2)
                                        .toString(),
                                    style: TextStyle(color: _textColor),
                                  ),
                                  Text(
                                    '($_displayPercentageChange%)',
                                    style: TextStyle(color: _textColor),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Flexible(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Text(
                                    'Prev.Close',
                                    style:
                                        TextStyle(color: MioColors.secondary),
                                  ),
                                  Text(_previousClose
                                      .toStringAsFixed(2)
                                      .toString()),
                                ],
                              ),
                              SizedBox(height: 4.0),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Text(
                                    'Open',
                                    style:
                                        TextStyle(color: MioColors.secondary),
                                  ),
                                  Text(_previousClose
                                      .toStringAsFixed(2)
                                      .toString()),
                                ],
                              ),
                            ],
                          ),
                        ),
                        SizedBox(width: 16.0),
                        Flexible(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Text(
                                    'High',
                                    style:
                                        TextStyle(color: MioColors.secondary),
                                  ),
                                  Text(_high.toStringAsFixed(2).toString()),
                                ],
                              ),
                              SizedBox(height: 4.0),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Text(
                                    'Low',
                                    style:
                                        TextStyle(color: MioColors.secondary),
                                  ),
                                  Text(_low.toStringAsFixed(2).toString()),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 8.0),
              Container(
                color: MioColors.fifth,
                child: Column(
                  children: <Widget>[
                    DefaultTabController(
                      length: 6,
                      child: TabBar(
                        tabs: [
                          Tab(text: '1m'),
                          Tab(text: '3m'),
                          Tab(text: '6m'),
                          Tab(text: 'YTD'),
                          Tab(text: '1y'),
                          Tab(text: 'All'),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 200.0,
                      child: StackedAreaCustomColorLineChart.withSampleData(),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 8.0),
              Container(
                color: MioColors.fifth,
                padding: EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'Earning History',
                        style: TextStyle(fontSize: 18.0),
                      ),
                    ),
                    SingleChildScrollView(
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
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
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
                  color: isHeader ? MioColors.secondary : MioColors.primary),
            ),
          ],
        ),
      ),
      verticalAlignment: _verticalAlignment,
    );
  }
}
