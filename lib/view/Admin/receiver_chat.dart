// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:intl/intl.dart';
// import 'package:provider/provider.dart';
// import 'package:rexparts/controller/chat_provider.dart';
// import 'package:rexparts/view/chat/chat_screen.dart';
// import 'package:rexparts/widget/chat_bubble.dart';
// import 'package:rexparts/widget/char_bottom_bar.dart';

// class ReceiverChat extends StatefulWidget {
//   final UserInfor? userInfor;

//   const ReceiverChat({
//     Key? key,
//     required this.userInfor,
//   }) : super(key: key);

//   @override
//   _ReceiverChatState createState() => _ReceiverChatState();
// }

// class _ReceiverChatState extends State<ReceiverChat> {
//   @override
//   Widget build(BuildContext context) {
//     final getChatPrd = Provider.of<ChatController>(context, listen: false);

//     // Fetch messages for the receiver (current user)
//     getChatPrd.getMessages(widget.userInfor!.id);

//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: const Color.fromARGB(255, 15, 147, 255),
//         foregroundColor: Colors.white,
//         title: Text("Chat with ${widget.userInfor!.fullName}"),
//       ),
//       body: Column(
//         children: [
//           Expanded(
//             child: Consumer<ChatController>(
//               builder: (context, value, child) {
//                 // Use ListView.builder to display messages
//                 return ListView.builder(
//                   reverse: true, // Show latest messages at the bottom
//                   itemCount: value.allMessage.length,
//                   itemBuilder: (context, index) {
//                     FirebaseAuth firebaseAuth = FirebaseAuth.instance;

//                     // Determine if the message is sent by the current user
//                     bool isSender = value.allMessage[index].senderId ==
//                         firebaseAuth.currentUser?.uid;

//                     DateTime timestamp = value.allMessage[index].timeStamp!;
//                     String formattedTime =
//                         DateFormat('hh:mm a').format(timestamp);

//                     // Display the message using ChatBubble widget
//                     return ChatBubble(
//                       isSent:
//                           !isSender, // isSent should be true if not the sender (receiver)
//                       message: value.allMessage[index].message ??
//                           '', // Handle null message
//                       time: formattedTime,
//                       type: value.allMessage[index].type ??
//                           'text', // Handle null type
//                     );
//                   },
//                 );
//               },
//             ),
//           ),
//           ChatBottomBar(
//             chatController: getChatPrd,
//             userInfor: widget.userInfor,
//           ),
//         ],
//       ),
//     );
//   }
// }
