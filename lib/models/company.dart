class Company {
  Company({
    this.globalId,
    this.name,
    this.type,
    this.ticker,
    this.industries,
    this.abstract,
    this.description,
  });

  factory Company.fromJson(Map<String, dynamic> json) {
    final dynamic company = json['company'];
    return Company(
      globalId: company['globalId'],
      name: company['name'],
      type: company['type'],
      ticker: company['assetInfo'].length == 0
          ? ''
          : company['assetInfo'][0]['ticker'],
      industries: <dynamic>[
        company['sector'],
        company['industryGroup'],
        company['industry']
      ].where((dynamic i) => i != null).join(' | '),
      abstract: company['description'].replaceAll('\n', ' ').substring(0, 200),
      description: company['description'],
    );
  }

  String globalId;
  String name;
  String type;
  String ticker;
  String industries;
  String abstract;
  String description;
}
