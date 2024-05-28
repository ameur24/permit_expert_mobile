class Seance {
  final int id;
  final String type;
  final String heureD;
  final String heureF;
  final String dateS;
  final String status;
   StatusCandidat candidat_status;
 StatusMoniteur moniteur_status;

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
      status: json['status'] ?? '',
      candidat_status: stringToStatusCandidat(json['statusCandidat'] ?? ''),
      moniteur_status: stringToStatusMoniteur(json['statusMoniteur'] ?? ''),
    );
  }
}

enum StatusCandidat { accepted, refused, awaiting, unknown }
StatusCandidat stringToStatusCandidat(String statusString) {
  switch (statusString) {
    case 'confirmee':
      return StatusCandidat.accepted;
    case 'refusee':
      return StatusCandidat.refused;
    case 'en attente':
      return StatusCandidat.awaiting;
    default:
      return StatusCandidat.unknown;
  }
}

enum StatusMoniteur { accepted, refused, awaiting, unknown }
StatusMoniteur stringToStatusMoniteur(String statusString) {
  switch (statusString) {
    case 'confirmee':
      return StatusMoniteur.accepted;
    case 'refusee':
      return StatusMoniteur.refused;
    case 'en attente':
      return StatusMoniteur.awaiting;
    default:
      return StatusMoniteur.unknown;
  }
}
