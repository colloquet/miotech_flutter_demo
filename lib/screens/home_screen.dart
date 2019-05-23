import 'package:flutter/material.dart';
import 'package:miotech_flutter_demo/screens/ami_screen.dart';
import 'package:miotech_flutter_demo/message/message_list_screen.dart';
import 'package:miotech_flutter_demo/screens/profile_screen.dart';
import 'package:miotech_flutter_demo/mio_colors.dart';
import 'package:miotech_flutter_demo/ami_icons.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;
  final List<Widget> _tabs = <Widget>[
    AMIScreen(),
    MessageListScreen(),
    ProfileScreen(),
  ];

  final PageController pageController = PageController();

  void onTap(int index) {
    pageController.jumpToPage(index);
  }

  void onPageChanged(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: MioColors.primary,
        unselectedItemColor: MioColors.secondary,
        onTap: onTap,
        currentIndex: _currentIndex,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(AmiIcons.ami_logo),
            title: Text('AMI'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.chat_bubble),
            title: Text('Messages'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            title: Text('Profile'),
          ),
        ],
      ),
      body: PageView(
        controller: pageController,
        onPageChanged: onPageChanged,
        children: _tabs,
        physics: const NeverScrollableScrollPhysics(),
      ),
    );
  }
}
