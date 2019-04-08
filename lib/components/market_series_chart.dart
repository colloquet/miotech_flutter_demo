import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'dart:math';
import 'package:miotech_flutter_demo/colors.dart';
import 'package:miotech_flutter_demo/market_series_data.dart';
import 'package:miotech_flutter_demo/components/spinner.dart';

class MarketSeriesChart extends StatefulWidget {
  final List<charts.Series> seriesList;
  final bool animate;

  MarketSeriesChart(this.seriesList, {this.animate});

  /// Creates a [LineChart] with sample data and no transition.
  factory MarketSeriesChart.withSampleData() {
    return MarketSeriesChart(
      _createSampleData(),
      // Disable animations for image tests.
      animate: false,
    );
  }

  @override
  _MarketSeriesChartState createState() => _MarketSeriesChartState();

  /// Create one series with sample hard coded data.
  static List<charts.Series<PriceData, DateTime>> _createSampleData() {
    final _random = Random();
    double randomVolumn() => 10 + 10 * _random.nextDouble();

    final marketSeries = marketSeriesData.skip(150).map((data) {
      return PriceData(DateTime.fromMillisecondsSinceEpoch(data[0]), data[1]);
    }).toList();

    final volumn = marketSeriesData.skip(150).map((data) {
      return PriceData(DateTime.fromMillisecondsSinceEpoch(data[0]), randomVolumn());
    }).toList();

    return [
      charts.Series<PriceData, DateTime>(
        id: 'Desktop',
        // colorFn specifies that the line will be blue.
        colorFn: (_, __) => charts.ColorUtil.fromDartColor(MioColors.brand),
        // areaColorFn specifies that the area skirt will be light blue.
        // areaColorFn: (_, __) =>
        // charts.MaterialPalette.blue.shadeDefault.lighter,
        domainFn: (PriceData data, _) => data.time,
        measureFn: (PriceData data, _) => data.value,
        measureOffsetFn: (_, __) => -100,
        data: marketSeries,
      ),
      charts.Series<PriceData, DateTime>(
        id: 'Desktop',
        colorFn: (_, __) => charts.ColorUtil.fromDartColor(MioColors.secondary),
        domainFn: (PriceData data, _) => data.time,
        measureFn: (PriceData data, _) => data.value,
        data: volumn,
      )..setAttribute(charts.rendererIdKey, 'customBar'),
    ];
  }
}

class _MarketSeriesChartState extends State<MarketSeriesChart> {
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
          : charts.TimeSeriesChart(
              widget.seriesList,
              defaultRenderer: charts.LineRendererConfig(includeArea: true),
              animate: widget.animate,
              customSeriesRenderers: [
                charts.BarRendererConfig(
                  customRendererId: 'customBar',
                ),
              ],
              layoutConfig: charts.LayoutConfig(
                leftMarginSpec: charts.MarginSpec.fixedPixel(20),
                rightMarginSpec: charts.MarginSpec.fixedPixel(0),
                topMarginSpec: charts.MarginSpec.fixedPixel(20),
                bottomMarginSpec: charts.MarginSpec.fixedPixel(20),
              ),
              domainAxis: charts.DateTimeAxisSpec(
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
                    color: charts.MaterialPalette.transparent,
                  ),
                ),
              ),
            ),
    );
  }
}

/// Sample linear data type.
class PriceData {
  final DateTime time;
  final double value;

  PriceData(this.time, this.value);
}
