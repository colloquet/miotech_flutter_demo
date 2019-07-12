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
      child: Container(
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(16.0)),
          color: MioColors.fifth,
        ),
        child: Center(child: Text(type, style: TextStyle(color: MioColors.primary))),
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
      ),
    );
  }
}
