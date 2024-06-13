import 'package:cloud_firestore/cloud_firestore.dart';

class MessageModel {
  String? content;
  String? senderId;

  String? recieverId;
  Timestamp? time;

  MessageModel({
    this.recieverId,
    this.senderId,
    this.content,
    this.time,
  });

  factory MessageModel.fromJson(Map<String, dynamic> json) {
    return MessageModel(
      recieverId: json["recieverId"],
      senderId: json["senderId"],
      content: json["content"],
      time: json["time"],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "content": content,
      "recieverId": recieverId,
      "senderId": senderId,
      "time": time,
    };
  }
}
