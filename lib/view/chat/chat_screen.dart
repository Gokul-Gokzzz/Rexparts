import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:rexparts/constants/amin_id.dart';
import 'package:rexparts/controller/chat_provider.dart';
import 'package:rexparts/model/user_model.dart';
import 'package:rexparts/service/chat_service.dart';

TextEditingController messageController = TextEditingController();

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key, this.user});
  final UserModel? user;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            bottom: 10,
            left: 5,
            right: 5,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: TextFormField(
                      controller: messageController,
                      style: TextStyle(fontSize: 15, color: Colors.white),
                      decoration: InputDecoration(
                        fillColor: Color.fromARGB(255, 19, 25, 35),
                        filled: true,
                        hintText: 'Message...',
                        hintStyle: GoogleFonts.raleway(
                            color: Colors.white, fontSize: 12),
                        floatingLabelStyle: TextStyle(color: Colors.white),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(50),
                        ),
                      ),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    if (messageController.text.isNotEmpty) {
                      ChatService().sendMessage(
                        user?.userId ?? adminId,
                        messageController.text,
                      );
                      log(user?.userId ?? '');
                      log(messageController.text);
                      messageController.clear();
                    }
                  },
                  child: CircleAvatar(
                    child: Icon(
                      Icons.send,
                      color: Colors.white,
                    ),
                    backgroundColor: Color(0xff02B4BF),
                    radius: size.height * 0.036,
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
