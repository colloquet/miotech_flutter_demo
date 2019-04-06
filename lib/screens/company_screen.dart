import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:miotech_flutter_demo/colors.dart';

class CompanyScreen extends StatelessWidget {
  CompanyScreen(this.company);

  final company;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(company['name']),
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Container(
            padding: EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  company['name'],
                  style: TextStyle(fontSize: 24.0),
                ),
                SizedBox(height: 16.0),
                Text(
                  [
                    company['sector'],
                    company['industryGroup'],
                    company['industry']
                  ].where((i) => i != null).join(' | '),
                  style: TextStyle(color: MioColors.secondary),
                ),
                SizedBox(height: 16.0),
                Text(
                  company['description'],
                  style: TextStyle(
                    height: 1.2,
                    fontSize: 16.0,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
