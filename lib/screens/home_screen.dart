import 'package:flutter/material.dart';
import 'package:miotech_flutter_demo/widgets/mio_drawer.dart';
import 'package:miotech_flutter_demo/widgets/all_list.dart';
import 'package:miotech_flutter_demo/widgets/company_list.dart';
import 'package:miotech_flutter_demo/widgets/people_list.dart';
import 'package:miotech_flutter_demo/widgets/news_list.dart';
import 'package:miotech_flutter_demo/widgets/message_list.dart';
import 'package:miotech_flutter_demo/widgets/security_list.dart';
import 'package:miotech_flutter_demo/widgets/ami_search_delegate/ami_search_delegate.dart';
import 'package:miotech_flutter_demo/mio_colors.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  String _currentTab = 'ami';
  TabController _tabController;
  final AmiSearchDelegate _delegate = AmiSearchDelegate();

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, initialIndex: 0, length: 5);
  }

  _handleTabChange(int index) {
    _tabController.animateTo(index);
  }

  _handleDrawTabChange(tabKey) {
    setState(() {
      _currentTab = tabKey;
    });
  }

  String _lastQuerySelected;

  @override
  Widget build(BuildContext context) {
    bool isAMI = _currentTab == 'ami';

    return Scaffold(
      appBar: AppBar(
        title: isAMI
            ? Text(_lastQuerySelected == null ? 'AMI' : _lastQuerySelected)
            : Text('Messages'),
        actions: <Widget>[
          if (isAMI)
            IconButton(
              tooltip: 'Search',
              icon: const Icon(Icons.search),
              onPressed: () async {
                final String selected = await showSearch<String>(
                  context: context,
                  delegate: _delegate,
                );
                if (selected != null &&
                    selected.isNotEmpty &&
                    selected != _lastQuerySelected) {
                  setState(() {
                    _lastQuerySelected = selected;
                  });
                }
              },
            )
        ],
        bottom: isAMI
            ? TabBar(
                controller: _tabController,
                isScrollable: true,
                unselectedLabelColor: MioColors.secondary,
                tabs: <Widget>[
                  Tab(text: 'All'),
                  Tab(text: 'Companies'),
                  Tab(text: 'People'),
                  Tab(text: 'Narratives'),
                  Tab(text: 'Securities'),
                ],
              )
            : null,
      ),
      drawer: MioDrawer(
        currentTab: _currentTab,
        onChange: _handleDrawTabChange,
      ),
      body: {
        'ami': TabBarView(
          controller: _tabController,
          children: <Widget>[
            AllList(onTabChange: _handleTabChange),
            CompanyList(),
            PeopleList(),
            NewsList(),
            SecurityList(),
          ],
        ),
        'messages': MessageList(),
      }[_currentTab],
    );
  }
}
