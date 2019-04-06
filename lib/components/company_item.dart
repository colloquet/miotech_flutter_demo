import 'package:flutter/material.dart';
import 'package:miotech_flutter_demo/screens/company_screen.dart';
import 'package:miotech_flutter_demo/components/relationship.dart';
import 'package:miotech_flutter_demo/colors.dart';

class CompanyItem extends StatelessWidget {
  CompanyItem({
    Key key,
    @required this.company,
  }) : super(key: key);
  final company;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => CompanyScreen(company)),
        );
      },
      onLongPress: () {
        showModalBottomSheet(
          context: context,
          builder: (BuildContext context) {
            return Container(
              padding: EdgeInsets.only(
                  bottom: MediaQuery.of(context).padding.bottom),
              child: Wrap(
                children: <Widget>[
                  ListTile(
                    leading: Icon(Icons.playlist_add),
                    title: Text('Add to Monitor Board'),
                    onTap: () {},
                  ),
                  ListTile(
                    leading: Icon(Icons.star),
                    title: Text('Favourite'),
                    onTap: () {},
                  ),
                ],
              ),
            );
          },
        );
      },
      child: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Text(
                  company['name'],
                  style: TextStyle(fontSize: 18.0),
                ),
                SizedBox(height: 8.0),
                Row(
                  children: <Widget>[
                    Text(
                      company['type'],
                      style: TextStyle(color: MioColors.brand),
                    ),
                    SizedBox(width: 8.0),
                    Flexible(
                      child: Text(
                        company['industry'],
                        style: TextStyle(color: MioColors.secondary),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 8.0),
                Text(
                  company['description']
                      .replaceAll('\n', ' ')
                      .substring(0, 200),
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(color: MioColors.secondary.withOpacity(0.6)),
                ),
              ],
            ),
          ),
          Stack(
            children: <Widget>[
              SizedBox(
                height: 32.0,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: <Widget>[
                    SizedBox(width: 16.0),
                    Relationship(type: 'Competitor'),
                    SizedBox(width: 8.0),
                    Relationship(type: 'Shareholder'),
                    SizedBox(width: 8.0),
                    Relationship(type: 'Investor'),
                    SizedBox(width: 8.0),
                    Relationship(type: 'Supplier'),
                    SizedBox(width: 8.0),
                    Relationship(type: 'Investee'),
                    SizedBox(width: 8.0),
                    Relationship(type: 'Branch'),
                    SizedBox(width: 8.0),
                    Relationship(type: 'Board member'),
                    SizedBox(width: 8.0),
                    Relationship(type: 'Key executive'),
                    SizedBox(width: 16.0),
                  ],
                ),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      stops: [0, 1],
                      colors: <Color>[
                        MioColors.base,
                        MioColors.base.withOpacity(0.0)
                      ],
                    ),
                  ),
                  height: 32.0,
                  width: 16.0,
                ),
              ),
              Align(
                alignment: Alignment.centerRight,
                child: Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.centerRight,
                      end: Alignment.centerLeft,
                      stops: [0, 1],
                      colors: <Color>[
                        MioColors.base,
                        MioColors.base.withOpacity(0.0)
                      ],
                    ),
                  ),
                  height: 32.0,
                  width: 16.0,
                ),
              ),
            ],
          ),
          SizedBox(height: 16.0)
        ],
      ),
    );
  }
}
