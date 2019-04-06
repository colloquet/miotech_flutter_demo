import 'package:flutter/material.dart';
import 'package:miotech_flutter_demo/components/company_list.dart';
import 'package:miotech_flutter_demo/components/people_list.dart';
import 'package:miotech_flutter_demo/components/news_list.dart';
import 'package:miotech_flutter_demo/components/message_list.dart';
import 'package:miotech_flutter_demo/components/security_list.dart';
import 'package:miotech_flutter_demo/colors.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String _currentTab = 'company';

  @override
  Widget build(BuildContext context) {
    final _handleTabChange = (tabKey) {
      setState(() {
        _currentTab = tabKey;
      });
    };

    return Scaffold(
      appBar: AppBar(
        title: Text(_currentTab[0].toUpperCase() + _currentTab.substring(1)),
      ),
      drawer: Drawer(
        child: Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(left: 16.0, right: 16.0, bottom: 20.0, top: 24.0 + MediaQuery.of(context).padding.top),
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
                    isActive: _currentTab == 'company',
                    tabKey: 'company',
                    title: 'Company',
                    icon: Icons.business,
                    onTap: _handleTabChange,
                  ),
                  DrawerItem(
                    isActive: _currentTab == 'people',
                    tabKey: 'people',
                    title: 'People',
                    icon: Icons.people,
                    onTap: _handleTabChange,
                  ),
                  DrawerItem(
                    isActive: _currentTab == 'news',
                    tabKey: 'news',
                    title: 'News',
                    icon: Icons.library_books,
                    onTap: _handleTabChange,
                  ),
                  DrawerItem(
                    isActive: _currentTab == 'security',
                    tabKey: 'security',
                    title: 'Security',
                    icon: Icons.show_chart,
                    onTap: _handleTabChange,
                  ),
                  DrawerItem(
                    isActive: _currentTab == 'message',
                    tabKey: 'message',
                    title: 'Message',
                    icon: Icons.message,
                    onTap: _handleTabChange,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
      body: AnimatedSwitcher(
        duration: const Duration(milliseconds: 300),
        transitionBuilder: (Widget child, Animation<double> animation) {
          return FadeTransition(
            child: child,
            opacity: animation,
          );
        },
        child: {
          'company': CompanyList(),
          'people': PeopleList(),
          'news': NewsList(),
          'security': SecurityList(),
          'message': MessageList(),
        }[_currentTab],
      ),
    );
  }
}

class DrawerItem extends StatelessWidget {
  const DrawerItem({
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
        style:
            TextStyle(color: isActive ? MioColors.primary : MioColors.secondary),
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
