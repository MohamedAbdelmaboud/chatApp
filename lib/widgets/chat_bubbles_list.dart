import 'package:chat/models/message_model.dart';
import 'package:flutter/material.dart';

import 'chat_bubble.dart';

class ChatBubblesListView extends StatelessWidget {
  final List<MessageModel> messageModels;
  final ScrollController scrollController;
  final String email;
  const ChatBubblesListView({
    super.key,
    required this.email,
    required this.messageModels,
    required this.scrollController,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      reverse: true,
      controller: scrollController,
      itemCount: messageModels.length,
      physics: const BouncingScrollPhysics(),
      itemBuilder: (BuildContext context, int index) {
        return messageModels[index].id == email
            ? ChatBubble(
                message: messageModels[index].message,
              )
            : SecondChatBubble(message: messageModels[index].message);
      },
    );
  }
}
