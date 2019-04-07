import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'dart:math';
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
    int randomMarketPrice() => 50 + _random.nextInt(10);
    int randomVolumn() => 1 + _random.nextInt(20);

    final marketSeries = [
      PriceData(DateTime(2000, 1, 1), 30),
      PriceData(DateTime(2000, 7, 1), 32),
      PriceData(DateTime(2001, 1, 1), 33),
      PriceData(DateTime(2001, 7, 1), 35),
      PriceData(DateTime(2002, 1, 1), 34),
      PriceData(DateTime(2002, 7, 1), 36),
      PriceData(DateTime(2003, 1, 1), 38),
      PriceData(DateTime(2003, 7, 1), 37),
      PriceData(DateTime(2004, 1, 1), randomMarketPrice()),
      PriceData(DateTime(2004, 7, 1), randomMarketPrice()),
      PriceData(DateTime(2005, 1, 1), randomMarketPrice()),
      PriceData(DateTime(2005, 7, 1), randomMarketPrice()),
      PriceData(DateTime(2006, 1, 1), randomMarketPrice()),
      PriceData(DateTime(2006, 7, 1), randomMarketPrice()),
      PriceData(DateTime(2007, 1, 1), randomMarketPrice()),
      PriceData(DateTime(2007, 7, 1), randomMarketPrice()),
      PriceData(DateTime(2008, 1, 1), randomMarketPrice()),
      PriceData(DateTime(2008, 7, 1), randomMarketPrice()),
      PriceData(DateTime(2009, 1, 1), randomMarketPrice()),
      PriceData(DateTime(2009, 7, 1), randomMarketPrice()),
      PriceData(DateTime(2010, 1, 1), randomMarketPrice()),
      PriceData(DateTime(2010, 7, 1), randomMarketPrice()),
      PriceData(DateTime(2011, 1, 1), randomMarketPrice()),
      PriceData(DateTime(2011, 7, 1), randomMarketPrice()),
      PriceData(DateTime(2012, 1, 1), randomMarketPrice()),
      PriceData(DateTime(2012, 7, 1), randomMarketPrice()),
      PriceData(DateTime(2013, 1, 1), randomMarketPrice()),
      PriceData(DateTime(2013, 7, 1), randomMarketPrice()),
      PriceData(DateTime(2014, 1, 1), randomMarketPrice()),
      PriceData(DateTime(2014, 7, 1), randomMarketPrice()),
      PriceData(DateTime(2015, 1, 1), randomMarketPrice()),
      PriceData(DateTime(2015, 7, 1), randomMarketPrice()),
      PriceData(DateTime(2016, 1, 1), randomMarketPrice()),
      PriceData(DateTime(2016, 7, 1), randomMarketPrice()),
      PriceData(DateTime(2017, 1, 1), randomMarketPrice()),
      PriceData(DateTime(2017, 7, 1), randomMarketPrice()),
      PriceData(DateTime(2018, 1, 1), randomMarketPrice()),
      PriceData(DateTime(2018, 7, 1), randomMarketPrice()),
      PriceData(DateTime(2019, 1, 1), randomMarketPrice()),
      PriceData(DateTime(2019, 7, 1), randomMarketPrice()),
    ];

    final volumn = [
      PriceData(DateTime(2000, 1, 1), randomVolumn()),
      PriceData(DateTime(2000, 7, 1), randomVolumn()),
      PriceData(DateTime(2001, 1, 1), randomVolumn()),
      PriceData(DateTime(2001, 7, 1), randomVolumn()),
      PriceData(DateTime(2002, 1, 1), randomVolumn()),
      PriceData(DateTime(2002, 7, 1), randomVolumn()),
      PriceData(DateTime(2003, 1, 1), randomVolumn()),
      PriceData(DateTime(2003, 7, 1), randomVolumn()),
      PriceData(DateTime(2004, 1, 1), randomVolumn()),
      PriceData(DateTime(2004, 7, 1), randomVolumn()),
      PriceData(DateTime(2005, 1, 1), randomVolumn()),
      PriceData(DateTime(2005, 7, 1), randomVolumn()),
      PriceData(DateTime(2006, 1, 1), randomVolumn()),
      PriceData(DateTime(2006, 7, 1), randomVolumn()),
      PriceData(DateTime(2007, 1, 1), randomVolumn()),
      PriceData(DateTime(2007, 7, 1), randomVolumn()),
      PriceData(DateTime(2008, 1, 1), randomVolumn()),
      PriceData(DateTime(2008, 7, 1), randomVolumn()),
      PriceData(DateTime(2009, 1, 1), randomVolumn()),
      PriceData(DateTime(2009, 7, 1), randomVolumn()),
      PriceData(DateTime(2010, 1, 1), randomVolumn()),
      PriceData(DateTime(2010, 7, 1), randomVolumn()),
      PriceData(DateTime(2011, 1, 1), randomVolumn()),
      PriceData(DateTime(2011, 7, 1), randomVolumn()),
      PriceData(DateTime(2012, 1, 1), randomVolumn()),
      PriceData(DateTime(2012, 7, 1), randomVolumn()),
      PriceData(DateTime(2013, 1, 1), randomVolumn()),
      PriceData(DateTime(2013, 7, 1), randomVolumn()),
      PriceData(DateTime(2014, 1, 1), randomVolumn()),
      PriceData(DateTime(2014, 7, 1), randomVolumn()),
      PriceData(DateTime(2015, 1, 1), randomVolumn()),
      PriceData(DateTime(2015, 7, 1), randomVolumn()),
      PriceData(DateTime(2016, 1, 1), randomVolumn()),
      PriceData(DateTime(2016, 7, 1), randomVolumn()),
      PriceData(DateTime(2017, 1, 1), randomVolumn()),
      PriceData(DateTime(2017, 7, 1), randomVolumn()),
      PriceData(DateTime(2018, 1, 1), randomVolumn()),
      PriceData(DateTime(2018, 7, 1), randomVolumn()),
      PriceData(DateTime(2019, 1, 1), randomVolumn()),
      PriceData(DateTime(2019, 7, 1), randomVolumn()),
    ];

    return [
      charts.Series<PriceData, DateTime>(
        id: 'Desktop',
        colorFn: (_, __) => charts.ColorUtil.fromDartColor(MioColors.brand),
        domainFn: (PriceData data, _) => data.time,
        measureFn: (PriceData data, _) => data.value,
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
          ? Center(child: CircularProgressIndicator())
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

class PriceData {
  final DateTime time;
  final int value;

  PriceData(this.time, this.value);
}
