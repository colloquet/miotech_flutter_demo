import 'package:flutter/material.dart';
import 'package:miotech_flutter_demo/widgets/relationship_list.dart';
import 'package:miotech_flutter_demo/widgets/charts/top_card_market_chart.dart';
import 'package:miotech_flutter_demo/company/company_screen.dart';
import 'package:miotech_flutter_demo/security/security_screen.dart';
import 'package:miotech_flutter_demo/mio_colors.dart';
import 'package:miotech_flutter_demo/models/company.dart';
import 'package:miotech_flutter_demo/models/security.dart';

class ExactMatchTopCard extends StatelessWidget {
  ExactMatchTopCard({this.company, this.security});
  final Company company;
  final Security security;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(12.0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
      ),
      elevation: 2.0,
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
                        CompanyScreen(company)),
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
                RelationshipList(
                  id: 'exact-relationship',
                  relationships: [
                    'Competitor',
                    'Shareholder',
                    'Investor',
                    'Supplier',
                    'Investee',
                    'Branch',
                    'Board member',
                    'Key executive',
                  ],
                ),
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
                        SecurityScreen(security)),
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
                          fontSize: 18.0,
                          color: MioColors.secondary,
                        ),
                      ),
                      SizedBox(width: 8.0),
                      Text(
                        'NSQ',
                        style: TextStyle(
                          color: MioColors.secondary,
                          fontSize: 12.0,
                        ),
                      ),
                      SizedBox(width: 8.0),
                      Text(
                        '2019-04-05 8:00 AM',
                        style: TextStyle(
                          color: MioColors.secondary,
                          fontSize: 12.0,
                        ),
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
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Text(
                                  'Close',
                                  style: TextStyle(
                                    color: MioColors.secondary,
                                    fontSize: 12.0,
                                  ),
                                ),
                                Text(
                                  '176.02',
                                  style: TextStyle(fontSize: 12.0),
                                ),
                              ],
                            ),
                            SizedBox(height: 4.0),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Text(
                                  'Open',
                                  style: TextStyle(
                                    color: MioColors.secondary,
                                    fontSize: 12.0,
                                  ),
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
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Text(
                                  'High',
                                  style: TextStyle(
                                    color: MioColors.secondary,
                                    fontSize: 12.0,
                                  ),
                                ),
                                Text(
                                  '177.00',
                                  style: TextStyle(fontSize: 12.0),
                                ),
                              ],
                            ),
                            SizedBox(height: 4.0),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Text(
                                  'Low',
                                  style: TextStyle(
                                    color: MioColors.secondary,
                                    fontSize: 12.0,
                                  ),
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
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Text(
                                  'Volume',
                                  style: TextStyle(
                                    color: MioColors.secondary,
                                    fontSize: 12.0,
                                  ),
                                ),
                                Text(
                                  '9.59M',
                                  style: TextStyle(fontSize: 12.0),
                                ),
                              ],
                            ),
                            SizedBox(height: 4.0),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Text(
                                  'Capital',
                                  style: TextStyle(
                                    color: MioColors.secondary,
                                    fontSize: 12.0,
                                  ),
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
    );
  }
}
