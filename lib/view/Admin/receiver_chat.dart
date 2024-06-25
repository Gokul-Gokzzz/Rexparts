// // ignore_for_file: library_private_types_in_public_api

// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:intl/intl.dart';
// import 'package:provider/provider.dart';
// import 'package:rexparts/controller/chat_provider.dart';
// import 'package:rexparts/widget/char_bottom_bar.dart';

// import 'package:rexparts/widget/chat_bubble.dart';

// class ReceiverChat extends StatefulWidget {
//   final UserInfor userInfor;
//   const ReceiverChat({
//     super.key,
//     required this.userInfor,
//   });

//   @override
//   _ChatScreenState createState() => _ChatScreenState();
// }

// class _ChatScreenState extends State<ReceiverChat> {
//   @override
//   Widget build(BuildContext context) {
//     final getChatPrd = Provider.of<ChatController>(context, listen: false);
//     getChatPrd.getMessages(widget.userInfor.id);

//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: const Color.fromARGB(255, 29, 141, 102),
//         foregroundColor: Colors.white,
//         title: Text("Chat with ${widget.userInfor.fullName}"),
//         actions: [
//           IconButton(
//             onPressed: () {},
//             icon: const Icon(Icons.call),
//           ),
//         ],
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
//             // userInfor: widget.userInfor, // Pass adminInfo here
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
