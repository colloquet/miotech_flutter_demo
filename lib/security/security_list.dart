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
      builder: (BuildContext context, MainModel model, _) {
        return ListView.separated(
          separatorBuilder: (BuildContext context, int index) => const Divider(height: 1.0),
          itemCount:
              model.securityData == null ? 0 : model.securityData.length,
          itemBuilder: (BuildContext context, int index) {
            final Security _security = model.securityData[index];
            return SecurityItem(
                key: ValueKey<String>(_security.globalId), security: _security);
          },
        );
      },
    );
  }
}
