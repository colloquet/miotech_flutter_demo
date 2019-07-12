import 'package:flutter/material.dart';
import 'package:miotech_flutter_demo/screens/ami_screen.dart';
import 'package:miotech_flutter_demo/message/message_list_screen.dart';
import 'package:miotech_flutter_demo/screens/profile_screen.dart';
import 'package:miotech_flutter_demo/mio_colors.dart';
import 'package:miotech_flutter_demo/ami_icons.dart';

class Destination {
  const Destination(this.index, this.widget);
  final int index;
  final Widget widget;
}

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  List<Key> _destinationKeys;
  List<AnimationController> _faders;
  int _currentIndex = 0;
  final List<Destination> allDestinations = <Destination>[
    Destination(0, AMIScreen()),
    Destination(1, MessageListScreen()),
    Destination(2, ProfileScreen()),
  ];

  // final PageController pageController = PageController();

  @override
  void initState() {
    super.initState();

    _faders = allDestinations.map<AnimationController>((Destination destination) {
      return AnimationController(vsync: this, duration: Duration(milliseconds: 200));
    }).toList();
    _faders[_currentIndex].value = 1.0;
    _destinationKeys = List<Key>.generate(allDestinations.length, (int index) => GlobalKey()).toList();
  }

  void onTap(int index) {
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
      body: Stack(
        fit: StackFit.expand,
        children: allDestinations.map((Destination destination) {
          final Widget view = FadeTransition(
            opacity: _faders[destination.index].drive(CurveTween(curve: Curves.fastOutSlowIn)),
            child: KeyedSubtree(
              key: _destinationKeys[destination.index],
              child: destination.widget,
            ),
          );
          if (destination.index == _currentIndex) {
            _faders[destination.index].forward();
            return view;
          } else {
            _faders[destination.index].reverse();
            if (_faders[destination.index].isAnimating) {
              return IgnorePointer(child: view);
            }
            return Offstage(child: view);
          }
        }).toList(),
      ),
      // body: PageView(
      //   controller: pageController,
      //   onPageChanged: onPageChanged,
      //   children: _tabs,
      //   physics: const NeverScrollableScrollPhysics(),
      // ),
    );
  }
}
