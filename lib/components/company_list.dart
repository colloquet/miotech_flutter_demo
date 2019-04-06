import 'package:flutter/material.dart';
import 'package:miotech_flutter_demo/components/company_item.dart';
import 'package:miotech_flutter_demo/colors.dart';

class CompanyList extends StatelessWidget {
  CompanyList({
    Key key,
    this.data,
  }) : super(key: key);
  final data;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      separatorBuilder: (context, index) => Divider(
            height: 1.0,
            color: MioColors.third,
          ),
      itemCount: data == null ? 0 : data.length,
      itemBuilder: (BuildContext context, int index) {
        var company = data[index]['company'];
        return CompanyItem(company: company);
      },
    );
  }
}
