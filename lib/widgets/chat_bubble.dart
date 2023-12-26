import 'package:chat/constants/constants.dart';
import 'package:flutter/material.dart';

import 'custom_text.dart';

class ChatBubble extends StatelessWidget {
  final String message;
  const ChatBubble({
    super.key,
    required this.message,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        margin: const EdgeInsets.all(10),
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
        decoration: const BoxDecoration(
          color: mainColor,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
            bottomRight: Radius.circular(30),
          ),
        ),
        child:  CustomText(
          message,
          fontSize: 12,
        ),
      ),
    );
  }
}
class SecondChatBubble extends StatelessWidget {
  final String message;
  const SecondChatBubble({
    super.key,
    required this.message,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: Container(
        margin: const EdgeInsets.all(10),
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
        decoration: const BoxDecoration(
          color: Color.fromARGB(255, 24, 128, 110),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
            bottomLeft: Radius.circular(30),
          ),
        ),
        child:  CustomText(
          message,
          fontSize: 12,
        ),
      ),
    );
  }
}
