class TransactionModel {
  int id;
  double montantT;
  String dateT;
  String description;
  String typeTransaction;

  TransactionModel({
    required this.id,
    required this.montantT,
    required this.dateT,
    required this.description,
    required this.typeTransaction,
  });

  factory TransactionModel.fromJson(Map<String, dynamic> json) {
    return TransactionModel(
      id: json['id'],
      montantT: json['montantT'].toDouble(),
      dateT: json['dateT'],
      description: json['description'],
      typeTransaction: json['Type_Transaction'],
    );
  }
}
