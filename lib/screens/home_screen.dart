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
  int _currentBottomTab = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: MioColors.primary,
        unselectedItemColor: MioColors.secondary,
        onTap: (int index) {
          setState(() {
            _currentBottomTab = index;
          });
        },
        currentIndex: _currentBottomTab,
        items: [
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
      // body: [
      //   AMIScreen(),
      //   MessagesScreen(),
      //   ProfileScreen(),
      // ][_currentBottomTab],
      body: AnimatedSwitcher(
        duration: Duration(milliseconds: 100),
        child: [
          AMIScreen(),
          MessageListScreen(),
          ProfileScreen(),
        ][_currentBottomTab],
        transitionBuilder: (widget, animation) {
          return FadeTransition(
            opacity: animation,
            child: widget,
          );
        },
      ),
    );
  }
}
