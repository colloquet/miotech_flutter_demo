import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:miotech_flutter_demo/scoped_models/main.dart';
import 'package:miotech_flutter_demo/components/company_item.dart';

class CompanyList extends StatelessWidget {
  CompanyList({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant<MainModel>(
      builder: (BuildContext context, Widget child, MainModel model) {
        return ListView.separated(
          separatorBuilder: (context, index) => Divider(height: 1.0),
          itemCount: model.companyData == null ? 0 : model.companyData.length,
          itemBuilder: (BuildContext context, int index) {
            var _company = model.companyData[index]['company'];
            return CompanyItem(key: ValueKey(_company['globalId']), company: _company);
          },
        );
      },
    );
  }
}
