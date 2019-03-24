import 'package:flutter/material.dart';
import 'dart:convert';
import 'CompanyScreen.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            Container(
              color: Color(0xff1e2534),
              child: DrawerHeader(
                child: CircleAvatar(
                  backgroundColor: Color(0xff171e2d),
                ),
              ),
            ),
            Container(
              child: Column(
                children: List.generate(4, (int index) {
                  return ListTile(
                    title: Text('List Item'),
                    leading: Icon(Icons.info, color: Color(0xff8ca0b3)),
                  );
                }),
              ),
            )
          ],
        ),
      ),
      body: FutureBuilder(
        future:
            DefaultAssetBundle.of(context).loadString('assets/mockData.json'),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }

          var data = json.decode(snapshot.data.toString());
          return RefreshIndicator(
            onRefresh: () => Future.delayed(Duration(seconds: 5)),
            child: ListView.builder(
              itemCount: data == null ? 0 : data.length,
              itemBuilder: (BuildContext context, int index) {
                var company = data[index]['company'];
                var isLast = index + 1 == data.length;

                return InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => CompanyScreen(company)),
                    );
                  },
                  child: Column(
                    children: <Widget>[
                      Dismissible(
                        onDismissed: (direction) {
                          var companyName = company['name'];
                          Scaffold.of(context).showSnackBar(SnackBar(content: Text("$companyName removed")));
                        },
                        direction: DismissDirection.endToStart,
                        background: Container(
                          color: Color(0xff1e2534),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: Icon(Icons.delete, color: Color(0xff8ca0b3)),
                              ),
                            ],
                          ),
                        ),
                        key: ValueKey(company['globalId']),
                        child: Container(
                          padding: EdgeInsets.all(16.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: <Widget>[
                              Text(
                                company['name'],
                                style: TextStyle(fontSize: 16.0),
                              ),
                              SizedBox(height: 8.0),
                              Text(
                                company['type'] + ' | ' + company['industry'],
                                style: TextStyle(color: Color(0xff8ca0b3)),
                              ),
                              SizedBox(height: 8.0),
                              Text(
                                company['description'].substring(1, 200),
                                maxLines: 3,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(color: Color(0x998ca0b3)),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Divider(
                        height: 0,
                        color: Color(0xff2d3446),
                      ),
                    ],
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
