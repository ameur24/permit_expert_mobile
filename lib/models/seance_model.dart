class Seance {
  final int id;
  final String type;
  final String heureD;
  final String heureF;
  final String dateS;
  final String status;

  Seance({
    required this.id,
    required this.type,
    required this.heureD,
    required this.heureF,
    required this.dateS,
    required this.status,
  });

  factory Seance.fromJson(Map<String, dynamic> json) {
    return Seance(
      id: json['id'],
      type: json['type'],
      heureD: json['heureD'],
      heureF: json['heureF'],
      dateS: json['dateS'],
      status: json['status'],
    );
  }
}
