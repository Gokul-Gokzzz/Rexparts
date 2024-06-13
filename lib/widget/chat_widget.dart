import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:rexparts/constants/amin_id.dart';
import 'package:rexparts/controller/chat_provider.dart';
import 'package:rexparts/service/auth_service.dart';

class ChatBubble extends StatelessWidget {
  const ChatBubble({
    super.key,
    required this.service,
    required this.size,
  });
  final AuthService service;
  final Size size;

  @override
  Widget build(BuildContext context) {
    return Consumer<ChatProvider>(
      builder: (context, value, child) => ListView.builder(
        itemCount: value.messages.length,
        itemBuilder: (context, index) {
          final chats = value.messages[index];
          log(chats.content.toString());
          DateTime dateTime = chats.time!.toDate();
          String formattedTime = DateFormat.jm().format(dateTime);

          var alignment = chats.recieverId == adminId
              ? Alignment.center
              : Alignment.centerLeft;
          var bubblecolor =
              chats.senderId == FirebaseAuth.instance.currentUser!.uid
                  ? Color.fromARGB(255, 47, 60, 68)
                  : Color.fromARGB(255, 4, 93, 108);

          var borderradius =
              chats.senderId == FirebaseAuth.instance.currentUser!.uid
                  ? const BorderRadius.only(
                      topLeft: Radius.circular(15),
                      bottomLeft: Radius.circular(15),
                      topRight: Radius.circular(15),
                    )
                  : const BorderRadius.only(
                      topRight: Radius.circular(15),
                      bottomLeft: Radius.circular(15),
                      bottomRight: Radius.circular(15),
                    );

          return Padding(
            padding: const EdgeInsets.fromLTRB(10, 0, 10, 20),
            child: Align(
              alignment: alignment,
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  minHeight: size.height * 0.05,
                  minWidth: size.width * 0.2,
                  maxWidth: size.width * 0.7,
                ),
                child: Container(
                  decoration: BoxDecoration(
                    color: bubblecolor,
                    borderRadius: borderradius,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          chats.content!,
                          style: GoogleFonts.raleway(
                            color: Colors.white,
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                        SizedBox(
                          width: size.width * 0.2,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text(
                                formattedTime,
                                style: TextStyle(
                                  fontSize: 10,
                                  color: Colors.white.withOpacity(0.7),
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
