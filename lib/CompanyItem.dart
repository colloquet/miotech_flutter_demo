import 'package:flutter/material.dart';
import 'CompanyScreen.dart';

class CompanyItem extends StatelessWidget {
  const CompanyItem({
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
                      style: TextStyle(color: Color(0xffcfb162)),
                    ),
                    SizedBox(
                      width: 8.0,
                    ),
                    Flexible(
                      child: Text(
                        company['industry'],
                        style: TextStyle(color: Color(0xff8ca0b3)),
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
                  style: TextStyle(color: Color(0x998ca0b3)),
                ),
              ],
            ),
          ),
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
          SizedBox(
            height: 16.0,
          )
        ],
      ),
    );
  }
}

class Relationship extends StatelessWidget {
  final String type;

  const Relationship({
    Key key,
    this.type,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Scaffold.of(context).showSnackBar(SnackBar(
          backgroundColor: Color(0xff2d3446),
          duration: Duration(seconds: 1),
          content: Text("You clicked on $type"),
        ));
      },
      child: Chip(
        backgroundColor: Color(0xff2d3446),
        label: Text(type),
        padding: EdgeInsets.all(0.0),
        labelStyle: TextStyle(color: Color(0xffe7e7e7)),
      ),
    );
  }
}
