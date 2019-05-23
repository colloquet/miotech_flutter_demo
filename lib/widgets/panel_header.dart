import 'package:flutter/material.dart';

class PanelHeader extends StatelessWidget {
  PanelHeader({
    Key key,
    this.title,
    this.color,
  }) : super(key: key);
  final String title;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
      color: color,
      child: Text(title),
    );
  }
}