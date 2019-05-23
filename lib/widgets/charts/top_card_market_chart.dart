import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:miotech_flutter_demo/market_series_data.dart';
import 'package:miotech_flutter_demo/mio_colors.dart';

class TopCardMarketChart extends StatefulWidget {
  const TopCardMarketChart(this.seriesList, {this.animate});

  factory TopCardMarketChart.withSampleData() {
    return TopCardMarketChart(
      _createSampleData(),
      animate: false,
    );
  }

  final List<dynamic> seriesList;
  final bool animate;

  @override
  _TopCardMarketChartState createState() => _TopCardMarketChartState();

  static List<charts.Series<PriceData, DateTime>> _createSampleData() {
    final List<PriceData> marketSeries = marketSeriesData.take(50).map((List<num> data) {
      return PriceData(DateTime.fromMillisecondsSinceEpoch(data[0]), data[1]);
    }).toList();

    return [
      charts.Series<PriceData, DateTime>(
        id: 'marketSeries',
        colorFn: (_, __) => charts.ColorUtil.fromDartColor(const Color(0xff9FBD6A)),
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
    return charts.TimeSeriesChart(
      widget.seriesList,
      defaultInteractions: false,
      defaultRenderer: charts.LineRendererConfig(includeArea: true),
      animate: widget.animate,
      layoutConfig: charts.LayoutConfig(
        leftMarginSpec: charts.MarginSpec.fixedPixel(0),
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
          lineStyle: charts.LineStyleSpec(
            color: charts.ColorUtil.fromDartColor(MioColors.fourth),
          ),
        ),
      ),
      primaryMeasureAxis: charts.NumericAxisSpec(
        renderSpec: charts.NoneRenderSpec(),
      ),
    );
  }
}

class PriceData {
  PriceData(this.time, this.value);
  final DateTime time;
  final double value;
}
