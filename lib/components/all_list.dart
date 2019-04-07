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
    return ListView(
      children: <Widget>[
        Panel(
          title: '34,538 Securities',
          children: <Widget>[
            SecurityItem(security: securityData[0]['security']),
            Divider(height: 1),
            SecurityItem(security: securityData[1]['security']),
            Divider(height: 1),
            SecurityItem(security: securityData[2]['security']),
            Divider(height: 1),
          ],
          onViewMore: () {
            onTabChange(4);
          },
        ),
        Panel(
          title: '11,390,040 Companies',
          children: <Widget>[
            CompanyItem(company: companyData[0]['company']),
            Divider(height: 1),
            CompanyItem(company: companyData[1]['company']),
            Divider(height: 1),
            CompanyItem(company: companyData[2]['company']),
            Divider(height: 1),
          ],
          onViewMore: () {
            onTabChange(1);
          },
        ),
        Panel(
          title: '3,457,077 Narratives',
          children: <Widget>[
            NewsItem(narrative: newsData[0]['narrative']),
            Divider(height: 1),
            NewsItem(narrative: newsData[1]['narrative']),
            Divider(height: 1),
            NewsItem(narrative: newsData[2]['narrative']),
            Divider(height: 1),
          ],
          onViewMore: () {
            onTabChange(3);
          },
        ),
        Panel(
          title: '4,952,691 People',
          children: <Widget>[
            PeopleItem(people: peopleData[0]['people']),
            Divider(height: 1),
            PeopleItem(people: peopleData[1]['people']),
            Divider(height: 1),
            PeopleItem(people: peopleData[2]['people']),
            Divider(height: 1),
          ],
          onViewMore: () {
            onTabChange(2);
          },
        ),
      ],
    );
  }
}

class Panel extends StatelessWidget {
  Panel({
    Key key,
    @required this.title,
    @required this.children,
    @required this.onViewMore,
  }) : super(key: key);

  final title;
  final children;
  final onViewMore;

  @override
  Widget build(BuildContext context) {
    List<Widget> _combinedChildren = [
      PanelHeader(title: title),
    ]
      ..addAll(children)
      ..add(InkWell(
        onTap: onViewMore,
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Text('View more',
              textAlign: TextAlign.center,
              style: TextStyle(color: MioColors.secondary)),
        ),
      ));

    return Card(
      margin: EdgeInsets.all(12.0),
      elevation: 2.0,
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
      ),
      color: MioColors.base,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: _combinedChildren,
      ),
    );
  }
}

class PanelHeader extends StatelessWidget {
  PanelHeader({
    Key key,
    this.title,
  }) : super(key: key);
  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: MioColors.fifth,
      padding: EdgeInsets.all(16.0),
      child: Text(title),
    );
  }
}
