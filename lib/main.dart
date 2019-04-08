import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:miotech_flutter_demo/screens/login_screen.dart';
import 'package:miotech_flutter_demo/screens/home_screen.dart';
import 'package:miotech_flutter_demo/mio_colors.dart';

var _companyData;
var _peopleData;
var _newsData;
var _securityData;

void main() async {
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);

  var snapshot = await Future.wait([
    rootBundle.loadString('assets/companies.json'),
    rootBundle.loadString('assets/people.json'),
    rootBundle.loadString('assets/news.json'),
    rootBundle.loadString('assets/securities.json'),
  ]);

  _companyData = json.decode(snapshot[0].toString());
  _peopleData = json.decode(snapshot[1].toString());
  _newsData = json.decode(snapshot[2].toString());
  _securityData = json.decode(snapshot[3].toString());

  runApp(MiotechDemo());
}

class MiotechDemo extends StatefulWidget {
  @override
  _MiotechDemoState createState() => _MiotechDemoState();
}

class _MiotechDemoState extends State<MiotechDemo> {
  bool _isLoggedIn = true;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'MioTech Demo',
        theme: ThemeData(
          primaryColor: MioColors.base,
          accentColor: MioColors.secondary,
          scaffoldBackgroundColor: MioColors.background,
          canvasColor: MioColors.base,
          splashColor: MioColors.fourth,
          highlightColor: MioColors.fifth,
          indicatorColor: MioColors.primary,
          primaryIconTheme: IconThemeData(
            color: MioColors.secondary,
          ),
          textTheme: TextTheme(
            body1: TextStyle(color: MioColors.primary),
            body2: TextStyle(color: MioColors.secondary),
          ),
          brightness: Brightness.dark,
        ),
        home: AnimatedSwitcher(
          duration: Duration(milliseconds: 300),
          transitionBuilder: (Widget child, Animation<double> animation) {
            return FadeTransition(
              child: child,
              opacity: animation,
            );
          },
          // child: LogoApp(),
          child: _isLoggedIn
              ? HomeScreen(
                  companyData: _companyData,
                  peopleData: _peopleData,
                  newsData: _newsData,
                  securityData: _securityData,
                )
              : LoginScreen(
                  onLogin: () {
                    setState(() {
                      _isLoggedIn = true;
                    });
                  },
                ),
        ));
  }
}
