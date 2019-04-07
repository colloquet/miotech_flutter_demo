import 'package:flutter/material.dart';
import 'package:miotech_flutter_demo/components/people_item.dart';
import 'package:miotech_flutter_demo/mio_colors.dart';

class PeopleList extends StatelessWidget {
  PeopleList({
    Key key,
    this.data,
  }) : super(key: key);
  final data;

  @override
  Widget build(BuildContext context) {
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
  }
}
