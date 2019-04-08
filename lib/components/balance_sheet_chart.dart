/// Bar chart example
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';
import 'package:miotech_flutter_demo/colors.dart';
import 'package:miotech_flutter_demo/components/spinner.dart';

class BalanceSheetChart extends StatefulWidget {
  final List<charts.Series> seriesList;
  final bool animate;

  BalanceSheetChart(this.seriesList, {this.animate});

  /// Creates a [BarChart] with sample data and no transition.
  factory BalanceSheetChart.withSampleData() {
    return BalanceSheetChart(
      _createSampleData(),
      // Disable animations for image tests.
      animate: false,
    );
  }

  @override
  _BalanceSheetChartState createState() => _BalanceSheetChartState();

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

    final data1 = [
      OrdinalSales('2013', 10),
      OrdinalSales('2014', 15),
      OrdinalSales('2015', 25),
      OrdinalSales('2016', 20),
      OrdinalSales('2017', 30),
      OrdinalSales('2018', 35),
      OrdinalSales('2019', 65),
    ];

    return [
      charts.Series<OrdinalSales, String>(
        id: 'Sales',
        colorFn: (_, __) => charts.ColorUtil.fromDartColor(MioColors.brand),
        domainFn: (OrdinalSales sales, _) => sales.year,
        measureFn: (OrdinalSales sales, _) => sales.sales,
        data: data,
      ),
      charts.Series<OrdinalSales, String>(
        id: 'Sales',
        colorFn: (_, __) => charts.ColorUtil.fromDartColor(Color(0xb350baf3)),
        domainFn: (OrdinalSales sales, _) => sales.year,
        measureFn: (OrdinalSales sales, _) => sales.sales,
        data: data1,
      ),
    ];
  }
}

class _BalanceSheetChartState extends State<BalanceSheetChart> {
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 1), () {
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
          ? Center(child: Spinner())
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
