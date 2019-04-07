import 'package:flutter/material.dart';
import 'package:miotech_flutter_demo/components/income_statement_chart.dart';
import 'package:miotech_flutter_demo/components/earning_history_table.dart';
import 'package:miotech_flutter_demo/components/balance_sheet_chart.dart';
import 'package:miotech_flutter_demo/components/cashflow_statement_chart.dart';
import 'package:miotech_flutter_demo/colors.dart';

class SecurityTabs extends StatefulWidget {
  SecurityTabs({
    Key key,
  }) : super(key: key);

  @override
  _SecurityTabsState createState() => _SecurityTabsState();
}

class _SecurityTabsState extends State<SecurityTabs>
    with TickerProviderStateMixin {
  TabController _tabController;
  int _currentTabIndex = 0;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(
      vsync: this,
      initialIndex: _currentTabIndex,
      length: 2,
    );
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
          color: MioColors.base,
          child: TabBar(
            controller: _tabController,
            unselectedLabelColor: MioColors.secondary,
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
                    color: MioColors.base,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        PanelHeader(title: 'Income Statement'),
                        // Divider(height: 0),
                        Padding(
                          padding: EdgeInsets.all(8.0),
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
                    color: MioColors.base,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        PanelHeader(title: 'Balance Sheet'),
                        Padding(
                          padding: EdgeInsets.all(8.0),
                          child: SizedBox(
                            height: 200.0,
                            child: BalanceSheetChart.withSampleData(),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 8.0),
                  Container(
                    color: MioColors.base,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        PanelHeader(title: 'Cashflow Statement'),
                        Padding(
                          padding: EdgeInsets.all(8.0),
                          child: SizedBox(
                            height: 200.0,
                            child: CashflowStatementChart.withSampleData(),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              )
            : Container(
                color: MioColors.base,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    PanelHeader(title: 'Earning History'),
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: EarningHistoryTable(),
                    ),
                  ],
                ),
              ),
      ],
    );
  }
}

class PanelHeader extends StatelessWidget {
  PanelHeader({
    Key key,
    this.title,
  }) : super(key: key);
  final title;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.0),
      color: MioColors.base,
      child: Text(title),
    );
  }
}
