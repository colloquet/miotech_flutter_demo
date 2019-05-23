import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:miotech_flutter_demo/widgets/charts/market_series_chart.dart';
import 'package:miotech_flutter_demo/security/security_tabs.dart';
import 'package:miotech_flutter_demo/mio_colors.dart';
import 'package:miotech_flutter_demo/models/security.dart';

class SecurityScreen extends StatelessWidget {
  SecurityScreen(this.security);

  final Security security;
  final DateFormat formatter = DateFormat('yyyy-MM-dd HH:mm:ss');

  @override
  Widget build(BuildContext context) {
    final String _ticker = security.ticker;
    final String _name = security.name;
    final int _lastUpdateTime = security.lastUpdateTime;
    final double _currentPrice = security.currentPrice;
    final double _changeFromPreviousClose = security.changeFromPreviousClose;
    final double _percentChangeFromPreviousClose =
        security.percentChangeFromPreviousClose;
    final double _previousClose = security.previousClose;
    final double _open = security.open;
    final double _high = security.high;
    final double _low = security.low;
    final String _displayPercentageChange =
        (_percentChangeFromPreviousClose * 100).toStringAsFixed(2).toString();
    final bool _isPositive = _changeFromPreviousClose >= 0;
    final Color _textColor = _isPositive ? MioColors.green : MioColors.orange;

    return Scaffold(
      appBar: AppBar(
        title: Text(_ticker),
      ),
      body: Scrollbar(
        child: SingleChildScrollView(
          child: SafeArea(
            child: Column(
              children: <Widget>[
                const SizedBox(height: 8.0),
                Container(
                  color: MioColors.base,
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        _name,
                        style: TextStyle(fontSize: 18.0),
                      ),
                      const SizedBox(height: 8.0),
                      Text(
                        formatter.format(DateTime.fromMillisecondsSinceEpoch(
                            _lastUpdateTime)),
                        style: TextStyle(color: MioColors.secondary),
                      ),
                      const SizedBox(height: 8.0),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: <Widget>[
                          Expanded(
                            child: Column(
                              children: <Widget>[
                                Row(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.baseline,
                                  textBaseline: TextBaseline.alphabetic,
                                  children: <Widget>[
                                    Text(security.currency),
                                    const SizedBox(width: 4.0),
                                    Text(
                                      _currentPrice.toString(),
                                      style: TextStyle(fontSize: 24.0),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 4.0),
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
                                const SizedBox(height: 4.0),
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
                          const SizedBox(width: 16.0),
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
                                const SizedBox(height: 4.0),
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
                const SizedBox(height: 8.0),
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
                              tabs: const <Tab>[
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
                        padding: const EdgeInsets.all(8.0),
                        child: SizedBox(
                          height: 300.0,
                          child: MarketSeriesChart.withSampleData(),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 8.0),
                SecurityTabs(),
                const SizedBox(height: 8.0),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
