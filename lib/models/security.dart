class Security {
  Security({
    this.globalId,
    this.name,
    this.ticker,
    this.currency,
    this.currentPrice,
    this.changeFromPreviousClose,
    this.percentChangeFromPreviousClose,
    this.lastUpdateTime,
    this.previousClose,
    this.open,
    this.high,
    this.low,
  });

  factory Security.fromJson(Map<String, dynamic> json) {
    final dynamic security = json['security'];
    return Security(
      globalId: security['globalId'],
      name: security['assetIDGroup']['name'],
      ticker: security['assetIDGroup']['ticker'],
      currency: security['currency'],
      currentPrice: security['currenctPrice']['adjustedPrice'].toDouble(),
      changeFromPreviousClose: security['equityAsset']['equityTradingQuote']
              ['changeFromPreviousClose']
          .toDouble(),
      percentChangeFromPreviousClose: security['equityAsset']
              ['equityTradingQuote']['percentChangeFromPreviousClose']
          .toDouble(),
      lastUpdateTime: int.parse(
          security['equityAsset']['equityTradingQuote']['lastUpdateTime']),
      previousClose: security['equityAsset']['equityTradingQuote']
              ['previousClose']
          .toDouble(),
      open: security['equityAsset']['equityTradingQuote']['open'].toDouble(),
      high: security['equityAsset']['equityTradingQuote']['high'].toDouble(),
      low: security['equityAsset']['equityTradingQuote']['low'].toDouble(),
    );
  }

  String globalId;
  String name;
  String ticker;
  String currency;
  double currentPrice;
  double changeFromPreviousClose;
  double percentChangeFromPreviousClose;
  int lastUpdateTime;
  double previousClose;
  double open;
  double high;
  double low;
}
