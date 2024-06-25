import 'package:cloud_firestore/cloud_firestore.dart';

enum NotificationType { chat, course, payment, review }

class NotificationModel {
  String? id;
  String? receiverId;
  String? title;

  String? body;

  NotificationModel({
    this.id,
    this.receiverId,
    this.title,
    this.body,
  });

  factory NotificationModel.fromJson(Map<String, dynamic> json) {
    return NotificationModel(
      id: json['id'],
      receiverId: json['receiverId'],
      title: json['title'],
      body: json['body'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'receiverId': receiverId,
      'title': title,
      'body': body,
    };
  }

  static NotificationType _parseNotificationType(String? type) {
    switch (type) {
      case 'chat':
        return NotificationType.chat;
      case 'product':
        return NotificationType.course;
      case 'payment':
        return NotificationType.payment;
      case 'review':
        return NotificationType.review;
      default:
        return NotificationType.chat;
    }
  }
}
