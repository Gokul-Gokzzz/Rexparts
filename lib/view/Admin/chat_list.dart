// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:provider/provider.dart';
// import 'package:rexparts/controller/chat_provider.dart';
// import 'package:rexparts/model/chat_model.dart';
// import 'package:rexparts/view/Admin/widget/chat_widget.dart';

// class ChatListScreen extends StatelessWidget {
//   const ChatListScreen({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     final chatController = Provider.of<ChatController>(context, listen: false);
//     WidgetsBinding.instance.addPostFrameCallback((_) {
//       chatController.getAllChats().catchError((error) {
//         print('Error fetching chats: $error');
//       });
//     });

//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: const Color.fromARGB(255, 241, 240, 240),
//         title: Text(
//           "Chats",
//           style: GoogleFonts.montserrat(fontWeight: FontWeight.bold),
//         ),
//         centerTitle: true,
//       ),
//       backgroundColor: const Color.fromARGB(255, 241, 240, 240),
//       body: Padding(
//         padding: const EdgeInsets.symmetric(horizontal: 20),
//         child: Consumer<ChatController>(
//           builder: (context, chatController, child) {
//             if (chatController.isLoading) {
//               return const Center(child: CircularProgressIndicator());
//             }
//             final List<ChatModel>? chats = chatController.myAllChat;
//             if (chats == null || chats.isEmpty) {
//               return const Center(
//                 child: Text(
//                   'No chats available',
//                   style: TextStyle(
//                     fontSize: 16,
//                     color: Colors.grey,
//                   ),
//                 ),
//               );
//             }
//             return ListView.separated(
//               itemCount: chats.length,
//               separatorBuilder: (context, index) => const SizedBox(height: 10),
//               itemBuilder: (context, index) {
//                 return ChatTileWidget(
//                   chatModel: chats[index],
//                 );
//               },
//             );
//           },
//         ),
//       ),
//     );
//   }
// }
