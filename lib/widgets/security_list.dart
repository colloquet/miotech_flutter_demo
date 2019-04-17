import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:miotech_flutter_demo/scoped_models/main.dart';
import 'package:miotech_flutter_demo/widgets/security_item.dart';

class SecurityList extends StatelessWidget {
  SecurityList({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant<MainModel>(
      builder: (BuildContext context, Widget child, MainModel model) {
        return ListView.separated(
          separatorBuilder: (context, index) => Divider(height: 1.0),
          itemCount: model.securityData == null ? 0 : model.securityData.length,
          itemBuilder: (BuildContext context, int index) {
            final _security = model.securityData[index]['security'];
            return SecurityItem(key: ValueKey(_security['globalId']), security: _security);
          },
        );
      },
    );
  }
}
