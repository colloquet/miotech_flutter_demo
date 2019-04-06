import 'package:flutter/material.dart';
import 'package:miotech_flutter_demo/components/company_item.dart';
import 'package:miotech_flutter_demo/components/security_item.dart';
import 'package:miotech_flutter_demo/components/news_item.dart';
import 'package:miotech_flutter_demo/components/people_item.dart';
import 'package:miotech_flutter_demo/colors.dart';

class AllList extends StatelessWidget {
  AllList({
    Key key,
    this.companyData,
    this.peopleData,
    this.newsData,
    this.securityData,
    this.onTabChange,
  }) : super(key: key);
  final companyData;
  final peopleData;
  final newsData;
  final securityData;
  final onTabChange;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SafeArea(
        child: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(top: 12.0, left: 12.0, right: 12.0),
              child: Material(
                elevation: 4.0,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(8),
                  bottomRight: Radius.circular(8),
                ),
                color: MioColors.base,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(8),
                          topRight: Radius.circular(8),
                        ),
                        color: MioColors.fifth,
                      ),
                      padding: EdgeInsets.all(16.0),
                      child: Text('34,538 Securities'),
                    ),
                    Column(
                      children: [
                        SecurityItem(security: securityData[0]['security']),
                        Divider(height: 1),
                        SecurityItem(security: securityData[1]['security']),
                        Divider(height: 1),
                        SecurityItem(security: securityData[2]['security']),
                      ],
                    ),
                    Divider(height: 1),
                    InkWell(
                      onTap: () {
                        onTabChange(4);
                      },
                      child: Padding(
                        padding: EdgeInsets.all(16.0),
                        child: Text('View more',
                            textAlign: TextAlign.center,
                            style: TextStyle(color: MioColors.secondary)),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 12.0, left: 12.0, right: 12.0),
              child: Material(
                elevation: 4.0,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(8),
                  bottomRight: Radius.circular(8),
                ),
                color: MioColors.base,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(8),
                            topRight: Radius.circular(8)),
                        color: MioColors.fifth,
                      ),
                      padding: EdgeInsets.all(16.0),
                      child: Text('11,390,040 Companies'),
                    ),
                    Column(
                      children: [
                        CompanyItem(company: companyData[0]['company']),
                        Divider(height: 1),
                        CompanyItem(company: companyData[1]['company']),
                        Divider(height: 1),
                        CompanyItem(company: companyData[2]['company']),
                      ],
                    ),
                    Divider(height: 1),
                    InkWell(
                      onTap: () {
                        onTabChange(1);
                      },
                      child: Padding(
                        padding: EdgeInsets.all(16.0),
                        child: Text('View more',
                            textAlign: TextAlign.center,
                            style: TextStyle(color: MioColors.secondary)),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 12.0, left: 12.0, right: 12.0),
              child: Material(
                elevation: 4.0,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(8),
                  bottomRight: Radius.circular(8),
                ),
                color: MioColors.base,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(8),
                          topRight: Radius.circular(8),
                        ),
                        color: MioColors.fifth,
                      ),
                      padding: EdgeInsets.all(16.0),
                      child: Text('3,457,077 Narratives'),
                    ),
                    Column(
                      children: [
                        NewsItem(narrative: newsData[0]['narrative']),
                        Divider(height: 1),
                        NewsItem(narrative: newsData[1]['narrative']),
                        Divider(height: 1),
                        NewsItem(narrative: newsData[2]['narrative']),
                      ],
                    ),
                    Divider(height: 1),
                    InkWell(
                      onTap: () {
                        onTabChange(3);
                      },
                      child: Padding(
                        padding: EdgeInsets.all(16.0),
                        child: Text('View more',
                            textAlign: TextAlign.center,
                            style: TextStyle(color: MioColors.secondary)),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                  top: 12.0, left: 12.0, right: 12.0, bottom: 12.0),
              child: Material(
                elevation: 4.0,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(8),
                  bottomRight: Radius.circular(8),
                ),
                color: MioColors.base,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(8),
                            topRight: Radius.circular(8)),
                        color: MioColors.fifth,
                      ),
                      padding: EdgeInsets.all(16.0),
                      child: Text('4,952,691 People'),
                    ),
                    Column(
                      children: [
                        PeopleItem(people: peopleData[0]['people']),
                        Divider(height: 1),
                        PeopleItem(people: peopleData[1]['people']),
                        Divider(height: 1),
                        PeopleItem(people: peopleData[2]['people']),
                      ],
                    ),
                    Divider(height: 1),
                    InkWell(
                      onTap: () {
                        onTabChange(2);
                      },
                      child: Padding(
                        padding: EdgeInsets.all(16.0),
                        child: Text('View more',
                            textAlign: TextAlign.center,
                            style: TextStyle(color: MioColors.secondary)),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
