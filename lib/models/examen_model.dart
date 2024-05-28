class Examen {
  final int id;
  final String type;
  final String heureD;
  final String heureF;
  final String dateE;
   Status status;



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
      status: stringToStatus(json['status']),    );
  }
}
enum Status {accepted,refused,awaiting}
Status stringToStatus(String statusString) {
  switch (statusString) {
    case 'confirmee':
      return Status.accepted;
    case 'refusee':
      return Status.refused;
    case 'en attente':
      return Status.awaiting;
    default:
      throw ArgumentError('Unknown status string: $statusString');
  }
}

