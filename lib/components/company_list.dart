import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:miotech_flutter_demo/components/company_item.dart';
import 'package:miotech_flutter_demo/colors.dart';

class CompanyList extends StatelessWidget {
  const CompanyList({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future:
          DefaultAssetBundle.of(context).loadString('assets/companies.json'),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }

        var data = json.decode(snapshot.data.toString());
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
      },
    );
  }
}
