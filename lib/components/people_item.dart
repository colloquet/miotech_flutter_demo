import 'package:flutter/material.dart';
import 'package:miotech_flutter_demo/screens/people_screen.dart';
import 'package:miotech_flutter_demo/components/relationship.dart';
import 'package:miotech_flutter_demo/colors.dart';

class PeopleItem extends StatelessWidget {
  const PeopleItem({
    Key key,
    @required this.people,
  }) : super(key: key);

  final people;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => PeopleScreen(people)),
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
                  people['name'],
                  style: TextStyle(fontSize: 18.0),
                ),
                SizedBox(height: 8.0),
                Row(
                  children: <Widget>[
                    Text(
                      'Company 1',
                      style: TextStyle(color: MioColors.brand),
                    ),
                    SizedBox(width: 16.0),
                    Text(
                      'Company 2',
                      style: TextStyle(color: MioColors.brand),
                    ),
                    SizedBox(width: 16.0),
                    Text(
                      'Company 3',
                      style: TextStyle(color: MioColors.brand),
                    ),
                  ],
                ),
                SizedBox(height: 8.0),
                Text(
                  people['bio'].replaceAll('\n', ' ').substring(0, 200),
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
                    Relationship(type: 'Company (As Key Executive)'),
                    SizedBox(width: 8.0),
                    Relationship(type: 'Company (As Board Member)'),
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
