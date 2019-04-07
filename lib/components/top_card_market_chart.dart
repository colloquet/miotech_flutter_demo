import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:miotech_flutter_demo/colors.dart';

class TopCardMarketChart extends StatefulWidget {
  final List<charts.Series> seriesList;
  final bool animate;

  TopCardMarketChart(this.seriesList, {this.animate});

  /// Creates a [LineChart] with sample data and no transition.
  factory TopCardMarketChart.withSampleData() {
    return TopCardMarketChart(
      _createSampleData(),
      // Disable animations for image tests.
      animate: false,
    );
  }

  @override
  _TopCardMarketChartState createState() => _TopCardMarketChartState();

  /// Create one series with sample hard coded data.
  static List<charts.Series<PriceData, DateTime>> _createSampleData() {
    final marketSeries = [
      PriceData(DateTime(2016, 7, 1), 32),
      PriceData(DateTime(2017, 1, 1), 25),
      PriceData(DateTime(2017, 7, 1), 35),
      PriceData(DateTime(2018, 1, 1), 40),
      PriceData(DateTime(2018, 7, 1), 50),
      PriceData(DateTime(2019, 1, 1), 38),
      PriceData(DateTime(2019, 7, 1), 37),
    ];

    return [
      charts.Series<PriceData, DateTime>(
        id: 'Desktop',
        // colorFn specifies that the line will be blue.
        colorFn: (_, __) => charts.ColorUtil.fromDartColor(Color(0xff9FBD6A)),
        // areaColorFn specifies that the area skirt will be light blue.
        // areaColorFn: (_, __) =>
        // charts.MaterialPalette.blue.shadeDefault.lighter,
        domainFn: (PriceData data, _) => data.time,
        measureFn: (PriceData data, _) => data.value,
        data: marketSeries,
      ),
    ];
  }
}

class _TopCardMarketChartState extends State<TopCardMarketChart> {
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
      child: charts.TimeSeriesChart(
        widget.seriesList,
        defaultRenderer: charts.LineRendererConfig(includeArea: true),
        animate: widget.animate,
        customSeriesRenderers: [
          charts.BarRendererConfig(
            customRendererId: 'customBar',
          ),
        ],
        layoutConfig: charts.LayoutConfig(
          leftMarginSpec: charts.MarginSpec.fixedPixel(0),
          rightMarginSpec: charts.MarginSpec.fixedPixel(0),
          topMarginSpec: charts.MarginSpec.fixedPixel(20),
          bottomMarginSpec: charts.MarginSpec.fixedPixel(20),
        ),
        domainAxis: charts.DateTimeAxisSpec(
          renderSpec: charts.SmallTickRendererSpec(
            labelStyle: charts.TextStyleSpec(
              color: charts.ColorUtil.fromDartColor(MioColors.secondary),
            ),
            lineStyle: charts.LineStyleSpec(
              color: charts.ColorUtil.fromDartColor(MioColors.fourth),
            ),
          ),
        ),
        primaryMeasureAxis: charts.NumericAxisSpec(
          renderSpec: charts.NoneRenderSpec(),
        ),
      ),
    );
  }
}

/// Sample linear data type.
class PriceData {
  final DateTime time;
  final int value;

  PriceData(this.time, this.value);
}
