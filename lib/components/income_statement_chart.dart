/// Bar chart example
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';
import 'package:miotech_flutter_demo/colors.dart';

class IncomeStatementChart extends StatefulWidget {
  final List<charts.Series> seriesList;
  final bool animate;

  IncomeStatementChart(this.seriesList, {this.animate});

  /// Creates a [BarChart] with sample data and no transition.
  factory IncomeStatementChart.withSampleData() {
    return IncomeStatementChart(
      _createSampleData(),
      // Disable animations for image tests.
      animate: false,
    );
  }

  @override
  _IncomeStatementChartState createState() => _IncomeStatementChartState();

  /// Create one series with sample hard coded data.
  static List<charts.Series<OrdinalSales, String>> _createSampleData() {
    final data = [
      OrdinalSales('2013', 20),
      OrdinalSales('2014', 25),
      OrdinalSales('2015', 35),
      OrdinalSales('2016', 30),
      OrdinalSales('2017', 40),
      OrdinalSales('2018', 45),
      OrdinalSales('2019', 75),
    ];

    return [
      charts.Series<OrdinalSales, String>(
        id: 'Sales',
        colorFn: (_, __) => charts.ColorUtil.fromDartColor(MioColors.brand),
        domainFn: (OrdinalSales sales, _) => sales.year,
        measureFn: (OrdinalSales sales, _) => sales.sales,
        data: data,
      )
    ];
  }
}

class _IncomeStatementChartState extends State<IncomeStatementChart> {
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 2), () {
      setState(() {
        isLoading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: Duration(milliseconds: 100),
      transitionBuilder: (Widget child, Animation<double> animation) {
        return FadeTransition(
          child: child,
          opacity: animation,
        );
      },
      child: isLoading
          ? Center(child: CircularProgressIndicator())
          : charts.BarChart(
              widget.seriesList,
              animate: widget.animate,
              barGroupingType: charts.BarGroupingType.grouped,
              domainAxis: charts.OrdinalAxisSpec(
                renderSpec: charts.SmallTickRendererSpec(
                  labelStyle: charts.TextStyleSpec(
                    color: charts.ColorUtil.fromDartColor(MioColors.secondary),
                  ),
                ),
              ),
              primaryMeasureAxis: charts.NumericAxisSpec(
                renderSpec: charts.GridlineRendererSpec(
                  labelStyle: charts.TextStyleSpec(
                    color: charts.ColorUtil.fromDartColor(MioColors.secondary),
                  ),
                  lineStyle: charts.LineStyleSpec(
                    color: charts.ColorUtil.fromDartColor(MioColors.third),
                  ),
                ),
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
