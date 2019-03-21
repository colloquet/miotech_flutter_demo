import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;

var _secondary = Color(0xff8ca0b3);
var _secondaryChartColor = charts.Color(
    r: _secondary.red,
    g: _secondary.green,
    b: _secondary.blue,
    a: _secondary.alpha);

List<charts.Series<OrdinalSales, String>> _createSampleData() {
  final data = [
    new OrdinalSales('2014', 5),
    new OrdinalSales('2015', 25),
    new OrdinalSales('2016', 100),
    new OrdinalSales('2017', 75),
  ];

  return [
    new charts.Series<OrdinalSales, String>(
      id: 'Sales',
      colorFn: (_, __) => charts.MaterialPalette.blue.shadeDefault,
      domainFn: (OrdinalSales sales, _) => sales.year,
      measureFn: (OrdinalSales sales, _) => sales.sales,
      data: data,
    )
  ];
}

class SimpleBarChart extends StatelessWidget {
  final List<charts.Series> seriesList;
  final bool animate;

  SimpleBarChart(this.seriesList, {this.animate});

  @override
  Widget build(BuildContext context) {
    return new charts.BarChart(
      seriesList,
      animate: animate,
      domainAxis: new charts.OrdinalAxisSpec(
        renderSpec: new charts.SmallTickRendererSpec(
          labelStyle: new charts.TextStyleSpec(
            fontSize: 18,
            color: _secondaryChartColor,
          ),
          lineStyle: new charts.LineStyleSpec(color: _secondaryChartColor),
        ),
      ),
      primaryMeasureAxis: new charts.NumericAxisSpec(
        renderSpec: new charts.GridlineRendererSpec(
          labelStyle: new charts.TextStyleSpec(
              fontSize: 18, color: _secondaryChartColor),
          lineStyle: new charts.LineStyleSpec(color: _secondaryChartColor),
        ),
      ),
    );
  }
}

/// Sample ordinal data type.
class OrdinalSales {
  final String year;
  final int sales;

  OrdinalSales(this.year, this.sales);
}

class CompanyScreen extends StatelessWidget {
  CompanyScreen(this.company);
  final company;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(company['name']),
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Container(
            padding: EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(
                  height: 200.0,
                  child: SimpleBarChart(
                    _createSampleData(),
                    animate: false,
                  ),
                ),
                SizedBox(height: 16.0),
                Text(
                  'Name',
                  style: Theme.of(context).textTheme.body2,
                ),
                SizedBox(
                  height: 8.0,
                ),
                Text(
                  company['name'],
                  style: TextStyle(fontSize: 16.0),
                ),
                SizedBox(
                  height: 16.0,
                ),
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
    );
  }
}
