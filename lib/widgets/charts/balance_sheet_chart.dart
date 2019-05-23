import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:miotech_flutter_demo/widgets/spinner.dart';
import 'package:miotech_flutter_demo/mio_colors.dart';

class BalanceSheetChart extends StatefulWidget {
  const BalanceSheetChart(this.seriesList, {this.animate});

  factory BalanceSheetChart.withSampleData() {
    return BalanceSheetChart(
      _createSampleData(),
      animate: false,
    );
  }

  final List<charts.Series<dynamic, dynamic>> seriesList;
  final bool animate;

  @override
  _BalanceSheetChartState createState() => _BalanceSheetChartState();

  static List<charts.Series<OrdinalSales, String>> _createSampleData() {
    final List<OrdinalSales> data = <OrdinalSales>[
      OrdinalSales('2013', 20),
      OrdinalSales('2014', 25),
      OrdinalSales('2015', 35),
      OrdinalSales('2016', 30),
      OrdinalSales('2017', 40),
      OrdinalSales('2018', 45),
      OrdinalSales('2019', 75),
    ];

    final List<OrdinalSales> data1 = <OrdinalSales>[
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
        colorFn: (_, __) => charts.ColorUtil.fromDartColor(const Color(0xb350baf3)),
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
    Future<void>.delayed(Duration(seconds: 1), () {
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

class OrdinalSales {
  OrdinalSales(this.year, this.sales);
  final String year;
  final int sales;
}
