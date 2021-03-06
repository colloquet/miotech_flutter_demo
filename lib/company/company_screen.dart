import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:miotech_flutter_demo/mio_colors.dart';
import 'package:miotech_flutter_demo/models/company.dart';

class CompanyScreen extends StatelessWidget {
  const CompanyScreen(this.company);
  final Company company;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(company.name),
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Container(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  company.name,
                  style: TextStyle(fontSize: 24.0),
                ),
                const SizedBox(height: 16.0),
                Text(
                  company.industries,
                  style: TextStyle(color: MioColors.secondary),
                ),
                const SizedBox(height: 16.0),
                Text(
                  company.description,
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
