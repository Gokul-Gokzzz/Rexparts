import 'package:flutter/material.dart';
import 'package:rexparts/model/chat_model.dart';
import 'package:rexparts/service/auth_service.dart';

class ChatProvider extends ChangeNotifier {
  List<MessageModel> messages = [];
  AuthService authService = AuthService();
  ScrollController scrollController = ScrollController();
  TextEditingController messageController = TextEditingController();
  List<MessageModel> getMessages(String currentuserid, String recieverId) {
    List ids = [currentuserid, recieverId];
    ids.sort();
    String chatroomid = ids.join("_");
    authService.firestore
        .collection("chat_room")
        .doc(chatroomid)
        .collection("messages")
        .orderBy("time", descending: false)
        .snapshots()
        .listen((message) {
      messages =
          message.docs.map((doc) => MessageModel.fromJson(doc.data())).toList();
      notifyListeners();
      scrollDown();
    });
    return messages;
  }

  void scrollDown() => WidgetsBinding.instance.addPostFrameCallback((_) {
        if (scrollController.hasClients) {
          scrollController.jumpTo(scrollController.position.maxScrollExtent);
        }
      });
}
