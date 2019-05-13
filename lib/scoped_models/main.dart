import 'package:flutter/material.dart';
import 'package:miotech_flutter_demo/models/company.dart';
import 'package:miotech_flutter_demo/models/people.dart';
import 'package:miotech_flutter_demo/models/narrative.dart';
import 'package:miotech_flutter_demo/models/security.dart';

class MainModel with ChangeNotifier {
  MainModel({
    this.companyData,
    this.peopleData,
    this.newsData,
    this.securityData,
  });
  List<Company> companyData;
  List<People> peopleData;
  List<Narrative> newsData;
  List<Security> securityData;
}
