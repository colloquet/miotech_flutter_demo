import 'package:scoped_model/scoped_model.dart';

class MainModel extends Model {
  MainModel({
    this.companyData,
    this.peopleData,
    this.newsData,
    this.securityData,
  });
  var companyData;
  var peopleData;
  var newsData;
  var securityData;
}
