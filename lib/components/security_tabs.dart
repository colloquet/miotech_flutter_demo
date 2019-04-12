import 'package:flutter/material.dart';
import 'package:miotech_flutter_demo/components/earning_history_table.dart';
import 'package:miotech_flutter_demo/components/panel_header.dart';
import 'package:miotech_flutter_demo/components/charts/income_statement_chart.dart';
import 'package:miotech_flutter_demo/components/charts/balance_sheet_chart.dart';
import 'package:miotech_flutter_demo/components/charts/cashflow_statement_chart.dart';
import 'package:miotech_flutter_demo/mio_colors.dart';

class SecurityTabs extends StatefulWidget {
  SecurityTabs({
    Key key,
  }) : super(key: key);

  @override
  _SecurityTabsState createState() => _SecurityTabsState();
}

class _SecurityTabsState extends State<SecurityTabs>
    with SingleTickerProviderStateMixin {
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
        AnimatedCrossFade(
          duration: Duration(milliseconds: 200),
          firstChild: Column(
            children: <Widget>[
              Container(
                color: MioColors.base,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    PanelHeader(title: 'Income Statement', color: MioColors.base),
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
                    PanelHeader(title: 'Balance Sheet', color: MioColors.base),
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
                    PanelHeader(title: 'Cashflow Statement', color: MioColors.base),
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
          ),
          secondChild: Container(
            color: MioColors.base,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                PanelHeader(title: 'Earning History', color: MioColors.base),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: EarningHistoryTable(),
                ),
              ],
            ),
          ),
          crossFadeState: _currentTabIndex == 0
              ? CrossFadeState.showFirst
              : CrossFadeState.showSecond,
        ),
      ],
    );
  }
}
