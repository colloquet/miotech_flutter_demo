import 'package:flutter/material.dart';
import 'package:miotech_flutter_demo/company/company_screen.dart';
import 'package:miotech_flutter_demo/widgets/relationship_list.dart';
import 'package:miotech_flutter_demo/mio_colors.dart';
import 'package:miotech_flutter_demo/models/company.dart';

List<String> relationships = <String>[
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
  final Company company;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute<dynamic>(
              builder: (BuildContext context) => CompanyScreen(company)),
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
                    leading: const Icon(Icons.playlist_add),
                    title: const Text('Add to Monitor Board'),
                    onTap: () {},
                  ),
                  ListTile(
                    leading: const Icon(Icons.star),
                    title: const Text('Favourite'),
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
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Text(
                  company.name,
                  style: TextStyle(fontSize: 18.0),
                ),
                const SizedBox(height: 8.0),
                Row(
                  children: <Widget>[
                    Text(
                      company.type,
                      style: TextStyle(color: MioColors.secondary),
                    ),
                    const SizedBox(width: 8.0),
                    Flexible(
                      child: Text(
                        company.ticker,
                        style: TextStyle(color: MioColors.brand),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8.0),
                Text(
                  company.abstract,
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(color: MioColors.secondary.withOpacity(0.6)),
                ),
              ],
            ),
          ),
          RelationshipList(id: company.globalId, relationships: relationships),
          const SizedBox(height: 16.0)
        ],
      ),
    );
  }
}
