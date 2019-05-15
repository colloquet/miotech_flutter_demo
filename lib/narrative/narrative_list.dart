import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:miotech_flutter_demo/scoped_models/main.dart';
import 'package:miotech_flutter_demo/narrative/narrative_item.dart';
import 'package:miotech_flutter_demo/models/narrative.dart';

class NarrativeList extends StatelessWidget {
  NarrativeList({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<MainModel>(
      builder: (context, model, _) {
        return Scrollbar(
          child: ListView.separated(
            separatorBuilder: (context, index) => Divider(height: 1.0),
            itemCount: model.newsData == null ? 0 : model.newsData.length,
            itemBuilder: (BuildContext context, int index) {
              Narrative _narrative = model.newsData[index];
              return NarrativeItem(key: ValueKey(_narrative.globalId), narrative: _narrative);
            },
          ),
        );
      },
    );
  }
}
