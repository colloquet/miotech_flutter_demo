import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:miotech_flutter_demo/scoped_models/main.dart';
import 'package:miotech_flutter_demo/people/people_item.dart';
import 'package:miotech_flutter_demo/models/people.dart';

class PeopleList extends StatelessWidget {
  PeopleList({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<MainModel>(
      builder: (BuildContext context, MainModel model, _) {
        return Scrollbar(
          child: ListView.separated(
            separatorBuilder: (BuildContext context, int index) => const Divider(height: 1.0),
            itemCount: model.peopleData == null ? 0 : model.peopleData.length,
            itemBuilder: (BuildContext context, int index) {
              final People _people = model.peopleData[index];
              return PeopleItem(key: ValueKey<String>(_people.globalId), people: _people);
            },
          ),
        );
      },
    );
  }
}
