import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:miotech_flutter_demo/components/people_item.dart';
import 'package:miotech_flutter_demo/colors.dart';

class PeopleList extends StatelessWidget {
  const PeopleList({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: DefaultAssetBundle.of(context).loadString('assets/people.json'),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return Center(child: CircularProgressIndicator());
        }

        var data = json.decode(snapshot.data.toString());
        return ListView.separated(
          separatorBuilder: (context, index) {
            return Divider(
              height: 1.0,
              color: MioColors.third,
            );
          },
          itemCount: data == null ? 0 : data.length,
          itemBuilder: (BuildContext context, int index) {
            final _people = data[index]['people'];
            return PeopleItem(people: _people);
          },
        );
      },
    );
  }
}
