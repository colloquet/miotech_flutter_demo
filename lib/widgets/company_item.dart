import 'package:flutter/material.dart';
import 'package:miotech_flutter_demo/screens/company_screen.dart';
import 'package:miotech_flutter_demo/widgets/relationship_list.dart';
import 'package:miotech_flutter_demo/mio_colors.dart';

var relationships = [
  'Competitor',
  'Shareholder',
  'Investor',
  'Supplier',
  'Investee',
  'Branch',
  'Board member',
  'Key executive',
];

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
                      style: TextStyle(color: MioColors.secondary),
                    ),
                    SizedBox(width: 8.0),
                    Flexible(
                      child: Text(
                        company['assetInfo'].length == 0
                            ? ''
                            : company['assetInfo'][0]['ticker'],
                        style: TextStyle(color: MioColors.brand),
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
          RelationshipList(id: company['globalId'], relationships: relationships),
          SizedBox(height: 16.0)
        ],
      ),
    );
  }
}
