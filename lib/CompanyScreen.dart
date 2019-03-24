import 'dart:ui';
import 'package:flutter/material.dart';

class CompanyScreen extends StatelessWidget {
  CompanyScreen(this.company);

  final company;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
              expandedHeight: 150.0,
              floating: false,
              pinned: true,
              flexibleSpace: FlexibleSpaceBar(
                centerTitle: false,
                title: SizedBox(
                  width: 200.0,
                  child: Text(company['name'],
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16.0,
                      )),
                ),
                background: Image.asset(
                  "assets/bg.jpg",
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ];
        },
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  'Type',
                  style: Theme.of(context).textTheme.body2,
                ),
                SizedBox(
                  height: 8.0,
                ),
                Text(
                  company['type'],
                  style: TextStyle(fontSize: 16.0),
                ),
                SizedBox(
                  height: 16.0,
                ),
                Text(
                  'Industry',
                  style: Theme.of(context).textTheme.body2,
                ),
                SizedBox(
                  height: 8.0,
                ),
                Text(
                  company['industry'],
                  style: TextStyle(fontSize: 16.0),
                ),
                SizedBox(
                  height: 16.0,
                ),
                Text(
                  'Description',
                  style: Theme.of(context).textTheme.body2,
                ),
                SizedBox(
                  height: 8.0,
                ),
                Text(
                  company['description'],
                  style: TextStyle(
                    height: 1.2,
                    fontSize: 16.0,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
//      body: SingleChildScrollView(
//        child: SafeArea(
//          child: Container(
//            padding: EdgeInsets.all(16.0),
//            child: Column(
//              crossAxisAlignment: CrossAxisAlignment.start,
//              children: <Widget>[
//                Text(
//                  company['name'],
//                  style: TextStyle(fontSize: 28.0, fontWeight: FontWeight.bold),
//                ),
////                SizedBox(
////                  height: 200.0,
////                  child: SimpleBarChart(
////                    _createSampleData(company),
////                    animate: false,
////                  ),
////                ),
//                SizedBox(height: 16.0),
//                SizedBox(
//                  height: 16.0,
//                ),
//                Text(
//                  'Type',
//                  style: Theme.of(context).textTheme.body2,
//                ),
//                SizedBox(
//                  height: 8.0,
//                ),
//                Text(
//                  company['type'],
//                  style: TextStyle(fontSize: 16.0),
//                ),
//                SizedBox(
//                  height: 16.0,
//                ),
//                Text(
//                  'Industry',
//                  style: Theme.of(context).textTheme.body2,
//                ),
//                SizedBox(
//                  height: 8.0,
//                ),
//                Text(
//                  company['industry'],
//                  style: TextStyle(fontSize: 16.0),
//                ),
//                SizedBox(
//                  height: 16.0,
//                ),
//                Text(
//                  'Description',
//                  style: Theme.of(context).textTheme.body2,
//                ),
//                SizedBox(
//                  height: 8.0,
//                ),
//                Text(
//                  company['description'],
//                  style: TextStyle(
//                    height: 1.2,
//                    fontSize: 16.0,
//                  ),
//                ),
//              ],
//            ),
//          ),
//        ),
//      ),
    );
  }
}
