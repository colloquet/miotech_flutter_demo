class Narrative {
  Narrative({
    this.globalId,
    this.eventType,
    this.source,
    this.timestamp,
    this.title,
    this.abstract,
    this.content,
    this.sentimentScore,
  });

  factory Narrative.fromJson(Map<String, dynamic> json) {
    final dynamic narrative = json['narrative'];
    return Narrative(
      globalId: narrative['globalId'],
      eventType: narrative['eventType'],
      abstract: narrative['abstract'],
      content: narrative['content'],
      title: narrative['title'],
      timestamp: narrative['timestamp'],
      source: narrative['source'],
      sentimentScore: narrative['sentimentScore'],
    );
  }

  String globalId;
  String eventType;
  String source;
  String timestamp;
  String title;
  String abstract;
  String content;
  double sentimentScore;
}
