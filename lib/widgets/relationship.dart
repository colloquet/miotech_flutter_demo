import 'package:flutter/material.dart';
import 'package:miotech_flutter_demo/mio_colors.dart';

class Relationship extends StatelessWidget {
  Relationship({
    Key key,
    this.type,
  }) : super(key: key);
  final String type;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Scaffold.of(context).showSnackBar(SnackBar(
          backgroundColor: MioColors.fourth,
          duration: Duration(seconds: 1),
          content: Text('You clicked on $type'),
        ));
      },
      child: Chip(
        backgroundColor: MioColors.fifth,
        label: Text(type),
        padding: const EdgeInsets.all(0.0),
        labelStyle: TextStyle(color: MioColors.primary),
      ),
    );
  }
}
