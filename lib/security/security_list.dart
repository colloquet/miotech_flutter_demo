import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:miotech_flutter_demo/scoped_models/main.dart';
import 'package:miotech_flutter_demo/security/security_item.dart';
import 'package:miotech_flutter_demo/models/security.dart';

class SecurityList extends StatelessWidget {
  SecurityList({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<MainModel>(
      builder: (context, model, _) {
        return Scrollbar(
          child: ListView.separated(
            separatorBuilder: (context, index) => Divider(height: 1.0),
            itemCount:
                model.securityData == null ? 0 : model.securityData.length,
            itemBuilder: (BuildContext context, int index) {
              Security _security = model.securityData[index];
              return SecurityItem(
                  key: ValueKey(_security.globalId), security: _security);
            },
          ),
        );
      },
    );
  }
}
