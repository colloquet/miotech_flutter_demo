import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:miotech_flutter_demo/screens/home_screen.dart';
import 'package:miotech_flutter_demo/scoped_models/main.dart';
import 'package:miotech_flutter_demo/mio_colors.dart';
import 'package:miotech_flutter_demo/models/company.dart';
import 'package:miotech_flutter_demo/models/people.dart';
import 'package:miotech_flutter_demo/models/narrative.dart';
import 'package:miotech_flutter_demo/models/security.dart';

List<Company> _companyData;
List<People> _peopleData;
List<Narrative> _newsData;
List<Security> _securityData;

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

  _companyData = json
      .decode(mockData[0].toString())
      .map<Company>((json) => Company.fromJson(json))
      .toList();
  _peopleData = json
      .decode(mockData[1].toString())
      .map<People>((json) => People.fromJson(json))
      .toList();
  _newsData = json
      .decode(mockData[2].toString())
      .map<Narrative>((json) => Narrative.fromJson(json))
      .toList();
  _securityData = json
      .decode(mockData[3].toString())
      .map<Security>((json) => Security.fromJson(json))
      .toList();

  runApp(MiotechDemo());
}

class MiotechDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<MainModel>(
      builder: (context) => MainModel(
            companyData: _companyData,
            peopleData: _peopleData,
            newsData: _newsData,
            securityData: _securityData,
          ),
      child: MaterialApp(
        title: 'MioTech Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primaryColor: MioColors.base,
          accentColor: MioColors.secondary,
          scaffoldBackgroundColor: MioColors.background,
          canvasColor: MioColors.base,
          splashColor: MioColors.fourth,
          highlightColor: MioColors.fifth,
          indicatorColor: MioColors.brand,
          dividerColor: MioColors.fourth,
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
