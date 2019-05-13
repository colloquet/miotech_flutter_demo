import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:miotech_flutter_demo/scoped_models/main.dart';
import 'package:miotech_flutter_demo/widgets/company_item.dart';
import 'package:miotech_flutter_demo/models/company.dart';

class CompanyList extends StatelessWidget {
  CompanyList({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<MainModel>(
      builder: (context, model, _) {
        return Scrollbar(
          child: ListView.separated(
            separatorBuilder: (context, index) => Divider(height: 1.0),
            itemCount: model.companyData == null ? 0 : model.companyData.length,
            itemBuilder: (BuildContext context, int index) {
              Company _company = model.companyData[index];
              return CompanyItem(key: ValueKey(_company.globalId), company: _company);
            },
          ),
        );
      },
    );
  }
}
