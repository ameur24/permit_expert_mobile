class Seance {
  final int id;
  final String type;
  final String heureDebut;
  final String heureFin;
  final String date;

  Seance({
    required this.id,
    required this.type,
    required this.heureDebut,
    required this.heureFin,
    required this.date,
  });

  factory Seance.fromJson(Map<String, dynamic> json) {
    return Seance(
      id: json['id'],
      type: json['type'],
      heureDebut: json['heureD'],
      heureFin: json['heureF'],
      date: json['dateS'],
    );
  }
}
