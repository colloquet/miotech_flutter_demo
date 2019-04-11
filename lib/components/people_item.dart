import 'package:flutter/material.dart';
import 'package:miotech_flutter_demo/screens/people_screen.dart';
import 'package:miotech_flutter_demo/components/relationship_list.dart';
import 'package:miotech_flutter_demo/mio_colors.dart';

var relationships = [
  'Company (As Board Member)',
  'Company (As Supervisory Board Member)',
  'Company (As Key Executive)',
];

class PeopleItem extends StatelessWidget {
  PeopleItem({
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
          RelationshipList(id: people['globalId'], relationships: relationships),
          SizedBox(height: 16.0)
        ],
      ),
    );
  }
}
