import 'examen_model.dart';

class Seance {
  final int id;
  final String type;
  final String heureD;
  final String heureF;
  final String dateS;
   Status status;
  Status candidat_status;
  Status moniteur_status;

  Seance({
    required this.id,
    required this.type,
    required this.heureD,
    required this.heureF,
    required this.dateS,
    required this.status,
    required this.candidat_status,
    required this.moniteur_status,
  });

  factory Seance.fromJson(Map<String, dynamic> json) {
    return Seance(
      id: json['id'],
      type: json['type'] ?? '',
      heureD: json['heureD'] ?? '',
      heureF: json['heureF'] ?? '',
      dateS: json['dateS'] ?? '',
      status: stringToStatus(json['status']),
      candidat_status: stringToStatus(json['candidat_status'] ),
      moniteur_status: stringToStatus(json['moniteur_status']),
    );
  }
}

Status stringToStatus(String statusString) {
  switch (statusString) {
    case 'confirmee':
      return Status.accepted;
    case 'refusee':
      return Status.refused;
    case 'en attente':
      return Status.awaiting;

  }
  return Status.accepted;
}


String statusToString(Status statusString) {
  switch (statusString) {
    case Status.accepted:
      return 'confirmee';
    case Status.refused:
      return 'refusee';
    case Status.awaiting:
      return  'en attente';

  }
}