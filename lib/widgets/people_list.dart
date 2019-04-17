import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:miotech_flutter_demo/scoped_models/main.dart';
import 'package:miotech_flutter_demo/widgets/people_item.dart';

class PeopleList extends StatelessWidget {
  PeopleList({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant<MainModel>(
      builder: (BuildContext context, Widget child, MainModel model) {
        return ListView.separated(
          separatorBuilder: (context, index) => Divider(height: 1.0),
          itemCount: model.peopleData == null ? 0 : model.peopleData.length,
          itemBuilder: (BuildContext context, int index) {
            final _people = model.peopleData[index]['people'];
            return PeopleItem(key: ValueKey(_people['globalId']), people: _people);
          },
        );
      },
    );
  }
}
