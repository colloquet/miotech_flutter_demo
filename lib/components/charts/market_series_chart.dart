import 'dart:math';
import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:miotech_flutter_demo/market_series_data.dart';
import 'package:miotech_flutter_demo/components/spinner.dart';
import 'package:miotech_flutter_demo/mio_colors.dart';

class MarketSeriesChart extends StatefulWidget {
  final List<charts.Series> seriesList;
  final bool animate;

  MarketSeriesChart(this.seriesList, {this.animate});

  factory MarketSeriesChart.withSampleData() {
    return MarketSeriesChart(
      _createSampleData(),
      animate: false,
    );
  }

  @override
  _MarketSeriesChartState createState() => _MarketSeriesChartState();

  static List<charts.Series<PriceData, DateTime>> _createSampleData() {
    final _random = Random();
    double randomVolumn() => 10 + 5 * _random.nextDouble();

    final marketSeries = marketSeriesData.skip(150).map((data) {
      return PriceData(DateTime.fromMillisecondsSinceEpoch(data[0]), data[1]);
    }).toList();

    final volumn = marketSeriesData.skip(150).map((data) {
      return PriceData(
          DateTime.fromMillisecondsSinceEpoch(data[0]), randomVolumn());
    }).toList();

    return [
      charts.Series<PriceData, DateTime>(
        id: 'marketSeries',
        colorFn: (_, __) => charts.ColorUtil.fromDartColor(MioColors.brand),
        domainFn: (PriceData data, _) => data.time,
        measureFn: (PriceData data, _) => data.value,
        measureOffsetFn: (_, __) => -100,
        data: marketSeries,
      ),
      charts.Series<PriceData, DateTime>(
        id: 'volumn',
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
                tickFormatterSpec: charts.AutoDateTimeTickFormatterSpec(
                  month: charts.TimeFormatterSpec(
                    format: '',
                    transitionFormat: 'yyyy',
                  ),
                ),
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

class PriceData {
  final DateTime time;
  final double value;

  PriceData(this.time, this.value);
}
