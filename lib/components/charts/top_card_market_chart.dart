import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:miotech_flutter_demo/market_series_data.dart';
import 'package:miotech_flutter_demo/mio_colors.dart';

class TopCardMarketChart extends StatefulWidget {
  final List<charts.Series> seriesList;
  final bool animate;

  TopCardMarketChart(this.seriesList, {this.animate});

  factory TopCardMarketChart.withSampleData() {
    return TopCardMarketChart(
      _createSampleData(),
      animate: false,
    );
  }

  @override
  _TopCardMarketChartState createState() => _TopCardMarketChartState();

  static List<charts.Series<PriceData, DateTime>> _createSampleData() {
    final marketSeries = marketSeriesData.map((data) {
      return PriceData(DateTime.fromMillisecondsSinceEpoch(data[0]), data[1]);
    }).toList();

    return [
      charts.Series<PriceData, DateTime>(
        id: 'Desktop',
        colorFn: (_, __) => charts.ColorUtil.fromDartColor(Color(0xff9FBD6A)),
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
    );
  }
}

class PriceData {
  final DateTime time;
  final double value;

  PriceData(this.time, this.value);
}
