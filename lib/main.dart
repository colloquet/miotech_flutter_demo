import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:miotech_flutter_demo/screens/home_screen.dart';
import 'package:miotech_flutter_demo/scoped_models/main.dart';
import 'package:miotech_flutter_demo/mio_colors.dart';

var _companyData;
var _peopleData;
var _newsData;
var _securityData;

void main() async {
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);

  var mockData = await Future.wait([
    rootBundle.loadString('assets/companies.json'),
    rootBundle.loadString('assets/people.json'),
    rootBundle.loadString('assets/news.json'),
    rootBundle.loadString('assets/securities.json'),
  ]);

  _companyData = json.decode(mockData[0].toString());
  _peopleData = json.decode(mockData[1].toString());
  _newsData = json.decode(mockData[2].toString());
  _securityData = json.decode(mockData[3].toString());

  runApp(MiotechDemo());
}

class MiotechDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final MainModel _model = MainModel(
      companyData: _companyData,
      peopleData: _peopleData,
      newsData: _newsData,
      securityData: _securityData,
    );

    return ScopedModel<MainModel>(
      model: _model,
      child: MaterialApp(
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
        home: HomeScreen(),
      ),
    );
  }
}
