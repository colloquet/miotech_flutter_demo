import 'package:flutter/material.dart';
import 'package:miotech_flutter_demo/components/income_statement_chart.dart';
import 'package:miotech_flutter_demo/components/earning_history_table.dart';
import 'package:miotech_flutter_demo/components/balance_sheet_chart.dart';
import 'package:miotech_flutter_demo/colors.dart';

class SecurityTabs extends StatefulWidget {
  const SecurityTabs({
    Key key,
  }) : super(key: key);

  @override
  _SecurityTabsState createState() => _SecurityTabsState();
}

class _SecurityTabsState extends State<SecurityTabs> {
  TabController _tabController;
  int _currentTabIndex = 0;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(
        vsync: ScrollableState(), initialIndex: _currentTabIndex, length: 2);
    _tabController.addListener(_handleTabChange);
  }

  _handleTabChange() {
    setState(() {
      _currentTabIndex = _tabController.index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          color: MioColors.fifth,
          child: TabBar(
            controller: _tabController,
            tabs: [
              Tab(text: 'Financials'),
              Tab(text: 'Events'),
            ],
          ),
        ),
        SizedBox(height: 8.0),
        _currentTabIndex == 0
            ? Column(
                children: <Widget>[
                  Container(
                    color: MioColors.fifth,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Text(
                            'Income Statement',
                            style: TextStyle(fontSize: 18.0),
                          ),
                        ),
                        Divider(height: 0),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: SizedBox(
                            height: 200.0,
                            child: IncomeStatementChart.withSampleData(),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 8.0),
                  Container(
                    color: MioColors.fifth,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Text(
                            'Balance Sheet',
                            style: TextStyle(fontSize: 18.0),
                          ),
                        ),
                        Divider(height: 0),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: SizedBox(
                            height: 200.0,
                            child: BalanceSheetChart.withSampleData(),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              )
            : Container(
                color: MioColors.fifth,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Text(
                        'Earning History',
                        style: TextStyle(fontSize: 18.0),
                      ),
                    ),
                    Divider(height: 0),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: EarningHistoryTable(),
                    ),
                  ],
                ),
              ),
      ],
    );
  }
}
