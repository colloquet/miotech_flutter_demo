import 'package:flutter/material.dart';
import 'package:miotech_flutter_demo/widgets/all_list.dart';
import 'package:miotech_flutter_demo/company/company_list.dart';
import 'package:miotech_flutter_demo/people/people_list.dart';
import 'package:miotech_flutter_demo/narrative/narrative_list.dart';
import 'package:miotech_flutter_demo/security/security_list.dart';
import 'package:miotech_flutter_demo/widgets/ami_search_delegate/ami_search_delegate.dart';
import 'package:miotech_flutter_demo/mio_colors.dart';

class AMIScreen extends StatefulWidget {
  @override
  _AMIScreenState createState() => _AMIScreenState();
}

class _AMIScreenState extends State<AMIScreen>
    with SingleTickerProviderStateMixin {
  TabController _tabController;
  final AmiSearchDelegate _delegate = AmiSearchDelegate();

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, initialIndex: 0, length: 5);
  }

  void _handleTabChange(int index) {
    _tabController.animateTo(index);
  }

  String _lastQuerySelected;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_lastQuerySelected == null ? 'AMI' : _lastQuerySelected),
        actions: <Widget>[
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
        bottom: TabBar(
          controller: _tabController,
          isScrollable: true,
          unselectedLabelColor: MioColors.secondary,
          tabs: const <Tab>[
            Tab(text: 'All'),
            Tab(text: 'Companies'),
            Tab(text: 'People'),
            Tab(text: 'Narratives'),
            Tab(text: 'Securities'),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: <Widget>[
          AllList(onTabChange: _handleTabChange),
          CompanyList(),
          PeopleList(),
          NarrativeList(),
          SecurityList(),
        ],
      ),
    );
  }
}
