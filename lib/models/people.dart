class People {
  People({
    this.globalId,
    this.name,
    this.abstract,
    this.bio,
    this.workExperiences,
  });

  factory People.fromJson(Map<String, dynamic> json) {
    final dynamic people = json['people'];
    return People(
      globalId: people['globalId'],
      name: people['name'],
      abstract: people['bio'].replaceAll('\n', ' ').substring(0, 200),
      bio: people['bio'],
      workExperiences: people['workExperiences'],
    );
  }

  String globalId;
  String name;
  String abstract;
  String bio;
  List<dynamic> workExperiences;
}
