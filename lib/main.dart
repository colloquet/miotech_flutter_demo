import 'package:flutter/material.dart';
import 'HomeScreen.dart';

void main() => runApp(MiotechDemo());

class MiotechDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MioTech Demo',
      theme: ThemeData(
        primaryColor: Color(0xff1e2534),
        accentColor: Color(0xff8ca0b3),
        scaffoldBackgroundColor: Color(0xff171e2d),
        canvasColor: Color(0xff171e2d),
        splashColor: Color(0xff1e2534),
        highlightColor: Color(0xff1e2534),
        primaryIconTheme: IconThemeData(
          color: Color(0xff8ca0b3),
        ),
        textTheme: TextTheme(
          body1: TextStyle(color: Color(0xffe7e7e7)),
          body2: TextStyle(color: Color(0xff8ca0b3)),
        ),
        brightness: Brightness.dark,
      ),
      home: HomeScreen(title: 'MioTech Demo'),
    );
  }
}
