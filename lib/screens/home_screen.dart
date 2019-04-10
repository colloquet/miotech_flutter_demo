import 'package:flutter/material.dart';
import 'package:miotech_flutter_demo/components/all_list.dart';
import 'package:miotech_flutter_demo/components/company_list.dart';
import 'package:miotech_flutter_demo/components/people_list.dart';
import 'package:miotech_flutter_demo/components/news_list.dart';
import 'package:miotech_flutter_demo/components/message_list.dart';
import 'package:miotech_flutter_demo/components/security_list.dart';
import 'package:miotech_flutter_demo/components/ami_search_delegate/ami_search_delegate.dart';
import 'package:miotech_flutter_demo/mio_colors.dart';
import 'package:miotech_flutter_demo/ami_icons.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
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
    return Scaffold(
      appBar: AppBar(
        title: _currentTab == 'ami'
            ? Text(_lastQuerySelected == null ? 'AMI' : _lastQuerySelected)
            : Text('Messages'),
        actions: <Widget>[
          IconButton(
            tooltip: 'Search',
            icon: const Icon(Icons.search),
            onPressed: () async {
              final String selected = await showSearch<String>(
                context: context,
                delegate: _delegate,
              );
              print(selected);
              if (selected != null && selected.isNotEmpty &&  selected != _lastQuerySelected) {
                setState(() {
                  _lastQuerySelected = selected;
                });
              }
            },
          ),
        ],
        bottom: _currentTab == 'ami'
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
      drawer: Drawer(
        child: Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(
                left: 16.0,
                right: 16.0,
                bottom: 20.0,
                top: 24.0 + MediaQuery.of(context).padding.top,
              ),
              color: MioColors.fifth,
              child: Row(
                children: <Widget>[
                  SizedBox(
                    height: 64.0,
                    width: 64.0,
                    child: CircleAvatar(
                      backgroundColor: Color(0xff12918b),
                      child: Text(
                        'MT',
                        style: TextStyle(
                          fontSize: 20.0,
                          color: MioColors.primary,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 16.0),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text('MioTech', style: TextStyle(fontSize: 16.0)),
                      Text(
                        'info@miotech.com',
                        style: TextStyle(color: MioColors.secondary),
                      ),
                    ],
                  )
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.only(top: 8.0),
              child: Column(
                children: [
                  DrawerItem(
                    isActive: _currentTab == 'ami',
                    tabKey: 'ami',
                    title: 'AMI',
                    icon: AmiIcons.ami_logo,
                    onTap: _handleDrawTabChange,
                  ),
                  DrawerItem(
                    isActive: _currentTab == 'messages',
                    tabKey: 'messages',
                    title: 'Messages',
                    icon: Icons.chat_bubble,
                    onTap: _handleDrawTabChange,
                  ),
                ],
              ),
            )
          ],
        ),
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

class DrawerItem extends StatelessWidget {
  DrawerItem({
    this.isActive,
    this.tabKey,
    this.title,
    this.onTap,
    this.icon,
  });
  final bool isActive;
  final String tabKey;
  final String title;
  final Function onTap;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 24.0),
      title: Text(
        title,
        style: TextStyle(
            color: isActive ? MioColors.primary : MioColors.secondary),
      ),
      leading:
          Icon(icon, color: isActive ? MioColors.primary : MioColors.secondary),
      onTap: () {
        onTap(tabKey);
        Navigator.pop(context);
      },
    );
  }
}
