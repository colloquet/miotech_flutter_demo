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
                      child: Text('MT', style: TextStyle(fontSize: 20.0)),
                    ),
                  ),
                  SizedBox(
                    width: 16.0,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text('MioTech', style: TextStyle(fontSize: 16.0)),
                      Text('info@miotech.com',
                          style: TextStyle(color: Color(0xff8ca0b3))),
                    ],
                  )
                ],
              ),
            ),
            Container(
              child: Column(
                children: [
                  ListTile(
                    title: Text(
                      'Company',
                      style: TextStyle(
                          color: currentTab == 'company'
                              ? Color(0xffe7e7e7)
                              : Color(0xff8ca0b3)),
                    ),
                    leading: Icon(Icons.business,
                        color: currentTab == 'company'
                            ? Color(0xffe7e7e7)
                            : Color(0xff8ca0b3)),
                    onTap: () {
                      setState(() {
                        currentTab = 'company';
                      });
                      Navigator.pop(context);
                    },
                  ),
                  ListTile(
                    title: Text(
                      'News',
                      style: TextStyle(
                          color: currentTab == 'news'
                              ? Color(0xffe7e7e7)
                              : Color(0xff8ca0b3)),
                    ),
                    leading: Icon(Icons.library_books,
                        color: currentTab == 'news'
                            ? Color(0xffe7e7e7)
                            : Color(0xff8ca0b3)),
                    onTap: () {
                      setState(() {
                        currentTab = 'news';
                      });
                      Navigator.pop(context);
                    },
                  ),
                  ListTile(
                    title: Text(
                      'Message',
                      style: TextStyle(
                          color: currentTab == 'message'
                              ? Color(0xffe7e7e7)
                              : Color(0xff8ca0b3)),
                    ),
                    leading: Icon(Icons.message,
                        color: currentTab == 'message'
                            ? Color(0xffe7e7e7)
                            : Color(0xff8ca0b3)),
                    onTap: () {
                      setState(() {
                        currentTab = 'message';
                      });
                      Navigator.pop(context);
                    },
                  ),
                ],
              ),
            )
          ],
        ),
      ),
      body: {
        'company': CompanyList(),
        'news': NewsList(),
        'message': MessageListScreen(),
      }[currentTab],
    );
  }
}
