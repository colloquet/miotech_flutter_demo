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
                SizedBox(
                  height: 16.0,
                ),
                Row(
                  children: <Widget>[
                    Text(
                      company['type'],
                      style: TextStyle(color: Color(0xffcfb162)),
                    ),
                    SizedBox(
                      width: 16.0,
                    ),
                    Flexible(
                      child: Text(
                        company['industry'],
                        style: TextStyle(color: Color(0xff8ca0b3)),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 16.0,
                ),
                Text(
                  company['description'],
                  style: TextStyle(
                    height: 1.2,
                    // color: Color(0xff8ca0b3),
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
