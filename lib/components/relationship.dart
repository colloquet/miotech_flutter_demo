import 'package:flutter/material.dart';
import 'package:miotech_flutter_demo/colors.dart';

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
          backgroundColor: MioColors.fourth,
          duration: Duration(seconds: 1),
          content: Text("You clicked on $type"),
        ));
      },
      child: Chip(
        backgroundColor: MioColors.fourth,
        label: Text(type),
        padding: EdgeInsets.all(0.0),
        labelStyle: TextStyle(color: MioColors.primary),
      ),
    );
  }
}
