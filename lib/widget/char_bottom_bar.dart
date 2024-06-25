// ignore_for_file: use_super_parameters

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rexparts/controller/chat_provider.dart';

import 'package:rexparts/view/chat/chat_screen.dart';
import 'package:rexparts/widget/media_query.dart';

class ChatBottomBar extends StatelessWidget {
  final ChatController chatController;

  final UserInfor? adminInfo;
  final UserInfor? userInfor;

  const ChatBottomBar({
    Key? key,
    required this.chatController,
    this.adminInfo,
    this.userInfor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: MediaQueryWidget().width(context, 0.052),
      ),
      child: SizedBox(
        height: MediaQueryWidget().width(context, 0.2),
        child: Row(
          children: [
            Flexible(
              child: TextField(
                controller: chatController.messageController,
                decoration: InputDecoration(
                  hintText: 'Type Something',
                  hintStyle: GoogleFonts.ubuntu(
                    color: Colors.grey,
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  ),
                  contentPadding: EdgeInsets.symmetric(
                    horizontal: MediaQueryWidget().width(context, .03),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(
                      MediaQueryWidget().width(context, 0.1),
                    ),
                  ),
                  suffixIcon: IconButton(
                    icon: Icon(
                      Icons.send,
                      color: Colors.blue[300],
                    ),
                    onPressed: () async {
                      if (chatController.messageController.text.isNotEmpty) {
                        await chatController.sendMessage(adminInfo!.id);

                        chatController.messageController.clear();
                        log('Message sent');
                      }
                    },
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
