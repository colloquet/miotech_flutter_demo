import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:miotech_flutter_demo/components/security_item.dart';
import 'package:miotech_flutter_demo/colors.dart';

class SecurityList extends StatelessWidget {
  const SecurityList({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future:
          DefaultAssetBundle.of(context).loadString('assets/securities.json'),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }

        final _data = json.decode(snapshot.data.toString());
        return ListView.separated(
          separatorBuilder: (context, index) {
            return Divider(
              height: 1.0,
              color: MioColors.third,
            );
          },
          itemCount: _data == null ? 0 : _data.length,
          itemBuilder: (BuildContext context, int index) {
            final _security = _data[index]['security'];
            return SecurityItem(security: _security);
          },
        );
      },
    );
  }
}
