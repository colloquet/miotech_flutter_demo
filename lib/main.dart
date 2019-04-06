import 'package:flutter/material.dart';
import 'package:miotech_flutter_demo/screens/login_screen.dart';
import 'package:miotech_flutter_demo/screens/home_screen.dart';
import 'package:miotech_flutter_demo/colors.dart';
import 'package:flutter/services.dart';

void main() async {
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);

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
        primaryColor: MioColors.fifth,
        accentColor: MioColors.secondary,
        scaffoldBackgroundColor: MioColors.base,
        canvasColor: MioColors.base,
        splashColor: MioColors.fifth,
        highlightColor: MioColors.fifth,
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
        duration: const Duration(milliseconds: 300),
        transitionBuilder: (Widget child, Animation<double> animation) {
          return FadeTransition(
            child: child,
            opacity: animation,
          );
        },
        child: _isLoggedIn
            ? HomeScreen()
            : LoginScreen(
                onLogin: () {
                  setState(() {
                    _isLoggedIn = true;
                  });
                },
              ),
      ),
    );
  }
}
