import 'package:flutter/material.dart';
import 'CompanyList.dart';
import 'NewsList.dart';
import 'MessageListScreen.dart';

class HomeScreen extends StatefulWidget {
  final String title;

  HomeScreen({this.title});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String currentTab = 'company';

  @override
  Widget build(BuildContext context) {
    var handleTabChange = (tabKey) {
      setState(() {
        currentTab = tabKey;
      });
    };

    return Scaffold(
      appBar: AppBar(
        title: Text(currentTab[0].toUpperCase() + currentTab.substring(1)),
      ),
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(16.0),
//              color: Color(0xff1e2534),
              child: Row(
                children: <Widget>[
                  SizedBox(
                    height: 48.0,
                    width: 48.0,
                    child: CircleAvatar(
                      backgroundColor: Color(0xff12918b),
                      child: Text(
                        'MT',
                        style: TextStyle(
                          fontSize: 20.0,
                          color: Color(0xffe7e7e7),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 16.0,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text('MioTech', style: TextStyle(fontSize: 16.0)),
                      Text(
                        'info@miotech.com',
                        style: TextStyle(color: Color(0xff8ca0b3)),
                      ),
                    ],
                  )
                ],
              ),
            ),
            Container(
              child: Column(
                children: [
                  DrawerItem(
                    isActive: currentTab == 'company',
                    tabKey: 'company',
                    title: 'Company',
                    icon: Icons.business,
                    onTap: handleTabChange,
                  ),
                  DrawerItem(
                    isActive: currentTab == 'news',
                    tabKey: 'news',
                    title: 'News',
                    icon: Icons.library_books,
                    onTap: handleTabChange,
                  ),
                  DrawerItem(
                    isActive: currentTab == 'message',
                    tabKey: 'message',
                    title: 'Message',
                    icon: Icons.message,
                    onTap: handleTabChange,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
      // body: {
      //   'company': CompanyList(),
      //   'news': NewsList(),
      //   'message': MessageListScreen(),
      // }[currentTab],
      body: AnimatedSwitcher(
        duration: const Duration(milliseconds: 200),
        transitionBuilder: (Widget child, Animation<double> animation) {
          return FadeTransition(
            child: child,
            opacity: animation,
          );
        },
        child: {
          'company': CompanyList(),
          'news': NewsList(),
          'message': MessageListScreen(),
        }[currentTab],
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
            TextStyle(color: isActive ? Color(0xffe7e7e7) : Color(0xff8ca0b3)),
      ),
      leading:
          Icon(icon, color: isActive ? Color(0xffe7e7e7) : Color(0xff8ca0b3)),
      onTap: () {
        onTap(tabKey);
        Navigator.pop(context);
      },
    );
  }
}
