import 'dart:ui';
import 'package:flutter/material.dart';

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
          child: Container(
            padding: EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  'Type',
                  style: Theme.of(context).textTheme.body2,
                ),
                SizedBox(
                  height: 8.0,
                ),
                Text(
                  company['type'],
                  style: TextStyle(fontSize: 16.0),
                ),
                SizedBox(
                  height: 16.0,
                ),
                Text(
                  'Industry',
                  style: Theme.of(context).textTheme.body2,
                ),
                SizedBox(
                  height: 8.0,
                ),
                Text(
                  company['industry'],
                  style: TextStyle(fontSize: 16.0),
                ),
                SizedBox(
                  height: 16.0,
                ),
                Text(
                  'Description',
                  style: Theme.of(context).textTheme.body2,
                ),
                SizedBox(
                  height: 8.0,
                ),
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
    );
  }
}
