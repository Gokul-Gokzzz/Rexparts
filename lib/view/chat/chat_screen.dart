// // ignore_for_file: library_private_types_in_public_api

// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:intl/intl.dart';
// import 'package:provider/provider.dart';
// import 'package:rexparts/controller/chat_provider.dart';
// import 'package:rexparts/widget/char_bottom_bar.dart';

// import 'package:rexparts/widget/chat_bubble.dart';

// class ChatScreen extends StatefulWidget {
//   final UserInfor adminInfo;
//   const ChatScreen({
//     super.key,
//     required this.adminInfo,
//   });

//   @override
//   _ChatScreenState createState() => _ChatScreenState();
// }

// class _ChatScreenState extends State<ChatScreen> {
//   @override
//   Widget build(BuildContext context) {
//     final getChatPrd = Provider.of<ChatController>(context, listen: false);
//     getChatPrd.getMessages(widget.adminInfo.id);

//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: const Color.fromARGB(255, 15, 147, 255),
//         foregroundColor: Colors.white,
//         title: const Text("Chat with me "),
//       ),
//       body: Column(
//         children: [
//           Expanded(
//             child: Consumer<ChatController>(
//               builder: (context, value, child) {
//                 return ListView.builder(
//                   reverse: true,
//                   itemCount: value.allMessage.length,
//                   itemBuilder: (context, index) {
//                     FirebaseAuth firebaseAuth = FirebaseAuth.instance;
//                     bool isSender = value.allMessage[index].senderId ==
//                         firebaseAuth.currentUser!.uid;
//                     DateTime timestamp = value.allMessage[index].timeStamp!;
//                     String formattedTime =
//                         DateFormat('hh:mm a').format(timestamp);
//                     return ChatBubble(
//                       isSent: isSender,
//                       message: value.allMessage[index].message!,
//                       time: formattedTime,
//                       type: value.allMessage[index].type!,
//                     );
//                   },
//                 );
//               },
//             ),
//           ),
//           ChatBottomBar(
//             chatController: getChatPrd,
//             adminInfo: widget.adminInfo,
//           ),
//         ],
//       ),
//     );
//   }
// }

// class UserInfor {
//   String id;
//   String fullName;
//   bool isAdmin;

//   UserInfor({
//     required this.id,
//     required this.fullName,
//     this.isAdmin = false,
//   });
// }

import 'package:flutter/material.dart';
import 'package:google_generative_ai/google_generative_ai.dart';
import 'package:intl/intl.dart';
import 'package:rexparts/model/chat_model.dart';
import 'package:rexparts/view/chat/chat_widget.dart';

class ChatBot extends StatefulWidget {
  const ChatBot({super.key});

  @override
  State<ChatBot> createState() => _ChatBotState();
}

class _ChatBotState extends State<ChatBot> {
  TextEditingController promptController = TextEditingController();
  static const apiKey = 'AIzaSyBoYH_Qa-p7wnUoeJiulcYFKP-09IlIkmE';
  final model = GenerativeModel(model: "gemini-pro", apiKey: apiKey);
  final List<ModelMessage> prompt = [];

  Future<void> sendMessage() async {
    final message = promptController.text;
    setState(() {
      promptController.clear();
      prompt.add(
        ModelMessage(
          isPrompt: true,
          message: message,
          time: DateTime.now(),
        ),
      );
    });
    final content = [Content.text(message)];
    final response = await model.generateContent(content);
    setState(() {
      prompt.add(
        ModelMessage(
          isPrompt: false,
          message: response.text ?? "",
          time: DateTime.now(),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text('RexG'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: prompt.length,
              itemBuilder: (context, index) {
                final message = prompt[index];
                return userPrompt(
                  isPrompt: message.isPrompt,
                  message: message.message,
                  date: DateFormat('hh:mm a').format(message.time),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(25),
            child: Row(
              children: [
                Expanded(
                  flex: 20,
                  child: TextField(
                    controller: promptController,
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                    ),
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      hintText: 'Enter what do you want',
                    ),
                  ),
                ),
                const Spacer(),
                GestureDetector(
                  onTap: () {
                    sendMessage();
                  },
                  child: const CircleAvatar(
                    radius: 29,
                    backgroundColor: Colors.green,
                    child: Icon(
                      Icons.send,
                      color: Colors.white,
                      size: 32,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
