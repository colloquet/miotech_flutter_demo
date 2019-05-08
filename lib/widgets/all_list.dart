import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:miotech_flutter_demo/scoped_models/main.dart';
import 'package:miotech_flutter_demo/widgets/company_item.dart';
import 'package:miotech_flutter_demo/widgets/security_item.dart';
import 'package:miotech_flutter_demo/widgets/news_item.dart';
import 'package:miotech_flutter_demo/widgets/people_item.dart';
import 'package:miotech_flutter_demo/widgets/panel_header.dart';
import 'package:miotech_flutter_demo/widgets/exact_match_top_card.dart';
import 'package:miotech_flutter_demo/mio_colors.dart';

class AllList extends StatelessWidget {
  AllList({
    Key key,
    this.onTabChange,
  }) : super(key: key);
  final onTabChange;

  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant<MainModel>(
      builder: (BuildContext context, Widget child, MainModel model) {
        return ListView(
          children: <Widget>[
            ExactMatchTopCard(
              company: model.companyData[0],
              security: model.securityData[0],
            ),
            Panel(
              title: '34,538 Securities',
              children: <Widget>[
                SecurityItem(security: model.securityData[0]['security']),
                Divider(height: 1),
                SecurityItem(security: model.securityData[1]['security']),
                Divider(height: 1),
                SecurityItem(security: model.securityData[2]['security']),
                Divider(height: 1),
              ],
              onViewMore: () {
                onTabChange(4);
              },
            ),
            Panel(
              title: '11,390,040 Companies',
              children: <Widget>[
                CompanyItem(company: model.companyData[0]['company']),
                Divider(height: 1),
                CompanyItem(company: model.companyData[1]['company']),
                Divider(height: 1),
                CompanyItem(company: model.companyData[2]['company']),
                Divider(height: 1),
              ],
              onViewMore: () {
                onTabChange(1);
              },
            ),
            Panel(
              title: '3,457,077 Narratives',
              children: <Widget>[
                NewsItem(narrative: model.newsData[0]['narrative']),
                Divider(height: 1),
                NewsItem(narrative: model.newsData[1]['narrative']),
                Divider(height: 1),
                NewsItem(narrative: model.newsData[2]['narrative']),
                Divider(height: 1),
              ],
              onViewMore: () {
                onTabChange(3);
              },
            ),
            Panel(
              title: '4,952,691 People',
              children: <Widget>[
                PeopleItem(people: model.peopleData[0]['people']),
                Divider(height: 1),
                PeopleItem(people: model.peopleData[1]['people']),
                Divider(height: 1),
                PeopleItem(people: model.peopleData[2]['people']),
                Divider(height: 1),
              ],
              onViewMore: () {
                onTabChange(2);
              },
            ),
          ],
        );
      },
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
      PanelHeader(title: title, color: MioColors.fifth),
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
      clipBehavior: Clip.hardEdge,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
      ),
      elevation: 2.0,
      color: MioColors.base,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: _combinedChildren,
      ),
    );
  }
}
