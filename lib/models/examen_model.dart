class Examen {
  final int id;
  final String type;
  final String heureD;
  final String heureF;
  final String dateE;
  final String status;



  Examen({
    required this.id,
    required this.type,
    required this.heureD,
    required this.heureF,
    required this.dateE,
    required this.status,

  });

  factory Examen.fromJson(Map<String, dynamic> json) {
    return Examen(
      id: json['id'],
      type: json['type'],
      heureD: json['heureD'],
      heureF: json['heureF'],
      dateE: json['dateE'],
      status: json['status'],
    );
  }
}
