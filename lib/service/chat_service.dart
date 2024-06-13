import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:rexparts/constants/amin_id.dart';
import 'package:rexparts/model/chat_model.dart';

class ChatService {
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  sendMessage(
    String recieverId,
    String message,
  ) async {
    final String? currentUserId = firebaseAuth.currentUser?.uid;

    final Timestamp timestamp = Timestamp.now();
    MessageModel newmessage = MessageModel(
        recieverId: recieverId,
        senderId: currentUserId ?? adminId,
        time: timestamp,
        content: message);

    List ids = [currentUserId, recieverId];
    ids.sort();
    String chatroomid = ids.join("_");
    await firestore
        .collection("chat_room")
        .doc(chatroomid)
        .collection("messages")
        .add(newmessage.toJson());
  }
}
