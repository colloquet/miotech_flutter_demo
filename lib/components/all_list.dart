import 'package:flutter/material.dart';
import 'package:miotech_flutter_demo/components/company_item.dart';
import 'package:miotech_flutter_demo/components/security_item.dart';
import 'package:miotech_flutter_demo/components/news_item.dart';
import 'package:miotech_flutter_demo/components/people_item.dart';
import 'package:miotech_flutter_demo/components/relationship_list.dart';
import 'package:miotech_flutter_demo/components/top_card_market_chart.dart';
import 'package:miotech_flutter_demo/screens/company_screen.dart';
import 'package:miotech_flutter_demo/screens/security_screen.dart';
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
        Card(
          margin: EdgeInsets.all(12.0),
          elevation: 2.0,
          clipBehavior: Clip.antiAlias,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
          color: MioColors.base,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            CompanyScreen(companyData[0]['company'])),
                  );
                },
                child: Column(
                  children: <Widget>[
                    Container(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: <Widget>[
                          Text(
                            'Facebook',
                            style: TextStyle(fontSize: 24.0),
                          ),
                          SizedBox(height: 8.0),
                          Text(
                            'Information Technology | Software and Services | Interactive Media and Services',
                            style: TextStyle(color: MioColors.secondary),
                          ),
                          SizedBox(height: 8.0),
                          Text(
                            'Facebook, Inc. engages in building products that enable people to connect and share with friends and family through mobile devices, personal computers, and other surfaces. The company helps people discover and learn about what is going on in the world around them; and enables people to share their opinions, ideas, photos and videos, and other activities...',
                            maxLines: 3,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    ),
                    RelationshipList(relationships: [
                      'Competitor',
                      'Shareholder',
                      'Investor',
                      'Supplier',
                      'Investee',
                      'Branch',
                      'Board member',
                      'Key executive',
                    ]),
                    SizedBox(height: 16.0),
                  ],
                ),
              ),
              Divider(height: 1),
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            SecurityScreen(securityData[0]['security'])),
                  );
                },
                child: Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: <Widget>[
                          Text(
                            'FB',
                            style: TextStyle(
                                fontSize: 18.0, color: MioColors.secondary),
                          ),
                          SizedBox(width: 8.0),
                          Text(
                            'NSQ',
                            style: TextStyle(
                                color: MioColors.secondary, fontSize: 12.0),
                          ),
                          SizedBox(width: 8.0),
                          Text(
                            '2019-04-05 8:00 AM',
                            style: TextStyle(
                                color: MioColors.secondary, fontSize: 12.0),
                          ),
                        ],
                      ),
                      SizedBox(height: 8.0),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.baseline,
                        textBaseline: TextBaseline.alphabetic,
                        children: <Widget>[
                          Text('USD'),
                          SizedBox(width: 4.0),
                          Text(
                            '175.72',
                            style: TextStyle(fontSize: 24.0),
                          ),
                          SizedBox(width: 8.0),
                          Text(
                            '-0.30',
                            style: TextStyle(color: MioColors.orange),
                          ),
                          Text(
                            '(-0.17%)',
                            style: TextStyle(color: MioColors.orange),
                          ),
                        ],
                      ),
                      SizedBox(height: 8.0),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: <Widget>[
                          Flexible(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Text(
                                      'Close',
                                      style: TextStyle(
                                          color: MioColors.secondary,
                                          fontSize: 12.0),
                                    ),
                                    Text(
                                      '176.02',
                                      style: TextStyle(fontSize: 12.0),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 4.0),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Text(
                                      'Open',
                                      style: TextStyle(
                                          color: MioColors.secondary,
                                          fontSize: 12.0),
                                    ),
                                    Text(
                                      '176.88',
                                      style: TextStyle(fontSize: 12.0),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          SizedBox(width: 16.0),
                          Flexible(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Text(
                                      'High',
                                      style: TextStyle(
                                          color: MioColors.secondary,
                                          fontSize: 12.0),
                                    ),
                                    Text(
                                      '177.00',
                                      style: TextStyle(fontSize: 12.0),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 4.0),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Text(
                                      'Low',
                                      style: TextStyle(
                                          color: MioColors.secondary,
                                          fontSize: 12.0),
                                    ),
                                    Text(
                                      '175.10',
                                      style: TextStyle(fontSize: 12.0),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          SizedBox(width: 16.0),
                          Flexible(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Text(
                                      'Volume',
                                      style: TextStyle(
                                          color: MioColors.secondary,
                                          fontSize: 12.0),
                                    ),
                                    Text(
                                      '9.59M',
                                      style: TextStyle(fontSize: 12.0),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 4.0),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Text(
                                      'Capital',
                                      style: TextStyle(
                                          color: MioColors.secondary,
                                          fontSize: 12.0),
                                    ),
                                    Text(
                                      '502.36B',
                                      style: TextStyle(fontSize: 12.0),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 100,
                        child: TopCardMarketChart.withSampleData(),
                      ),
                    ],
                  ),
                ),
              ),
              Divider(height: 1),
              Padding(
                padding: EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Text('Competitors'),
                    SizedBox(height: 8.0),
                    Row(
                      children: <Widget>[
                        Text('Vivendi SA',
                            style: TextStyle(color: MioColors.brand)),
                        SizedBox(width: 8.0),
                        Text('Walmart Inc.',
                            style: TextStyle(color: MioColors.brand)),
                        SizedBox(width: 8.0),
                        Text('EFactor Group Corp.',
                            style: TextStyle(color: MioColors.brand)),
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
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
