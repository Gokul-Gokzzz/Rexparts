// import 'package:cloud_firestore/cloud_firestore.dart';

// class ChatModel {
//   String? uId1;
//   String? chatRoomId;
//   String? uId2;
//   String? lastMessage;

//   DateTime? timeStamp;

//   ChatModel({
//     this.uId1,
//     this.uId2,
//     this.lastMessage,
//     this.chatRoomId,
//     this.timeStamp,
//   });

//   factory ChatModel.fromJson(json) {
//     return ChatModel(
//       uId1: json['uId1'],
//       lastMessage: json['lastMessage'],
//       chatRoomId: json['chatRoomId'],
//       uId2: json['uId2'],
//       timeStamp: json['timeStamp'] != null
//           ? (json['timeStamp'] as Timestamp).toDate()
//           : null,
//     );
//   }

//   Map<String, dynamic> toJson() {
//     return {
//       'uId1': uId1,
//       'uId2': uId2,
//       'lastMessage': lastMessage,
//       'chatRoomId': chatRoomId,
//       'timeStamp': timeStamp,
//     };
//   }
// }

class ModelMessage {
  final bool isPrompt;
  final String message;
  final DateTime time;

  ModelMessage({
    required this.isPrompt,
    required this.message,
    required this.time,
  });
}
