class LearnModel {
  final int id;
  final String title;
  final String description;
  final String date;
  final String link;
  final String? image;
  final String series;

  LearnModel({
    required this.id,
    required this.title,
    required this.description,
    required this.date,
    required this.link,
    this.image,
    required this.series,
  });

  factory LearnModel.fromJson(Map<String, dynamic> json) {
    return LearnModel(
      id: json['id'] ?? 0,
      title: json['titreR'] ?? '',
      description: json['descriptionR'] ?? '',
      date: json['dateD'] ?? '',
      link: json['link'] ?? '',
      image: json['Image'],
      series: json['NSerie'] ?? '',
    );
  }
}
