class NotificationModel {
  int? id;
  int? messageId;
  String? messageDescription;
  int? senderMsg;
  int? receptientMsg;
  String? createdAt;
  String? updatedAt;

  NotificationModel(
      {this.id,
        this.messageId,
        this.messageDescription,
        this.senderMsg,
        this.receptientMsg,
        this.createdAt,
        this.updatedAt});

  NotificationModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    messageId = json['message_id'];
    messageDescription = json['message_description'];
    senderMsg = json['sender_msg'];
    receptientMsg = json['receptient_msg'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['message_id'] = this.messageId;
    data['message_description'] = this.messageDescription;
    data['sender_msg'] = this.senderMsg;
    data['receptient_msg'] = this.receptientMsg;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}