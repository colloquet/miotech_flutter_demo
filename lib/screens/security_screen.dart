import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:miotech_flutter_demo/components/charts/market_series_chart.dart';
import 'package:miotech_flutter_demo/components/security_tabs.dart';
import 'package:miotech_flutter_demo/mio_colors.dart';

class SecurityScreen extends StatelessWidget {
  SecurityScreen(this.security);
  final security;
  final formatter = DateFormat('yyyy-MM-dd HH:mm:ss');

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
                color: MioColors.base,
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
                                    'Close',
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
                                  Text(_open.toStringAsFixed(2).toString()),
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
                color: MioColors.base,
                child: Column(
                  children: <Widget>[
                    Stack(
                      children: <Widget>[
                        Positioned.fill(
                          child: Container(
                            decoration: BoxDecoration(
                              border: Border(
                                bottom: BorderSide(
                                  color: MioColors.fourth,
                                  width: 1.0,
                                ),
                              ),
                            ),
                          ),
                        ),
                        DefaultTabController(
                          length: 6,
                          child: TabBar(
                            unselectedLabelColor: MioColors.secondary,
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
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: SizedBox(
                        height: 200.0,
                        child: MarketSeriesChart.withSampleData(),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 8.0),
              SecurityTabs(),
            ],
          ),
        ),
      ),
    );
  }
}
