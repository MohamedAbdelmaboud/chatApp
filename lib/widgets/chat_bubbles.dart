import 'package:chat/cubits/chat_cubit/chat_cubit.dart';
import 'package:chat/cubits/chat_cubit/chat_state.dart';
import 'package:chat/models/message_model.dart';
import 'package:chat/widgets/chat_bubble.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChatBubbles extends StatefulWidget {
  const ChatBubbles(
      {super.key, required this.scrollController, required this.email});
  final ScrollController scrollController;
  final String email;

  @override
  State<ChatBubbles> createState() => _ChatBubblesState();
}

class _ChatBubblesState extends State<ChatBubbles> {
  List<MessageModel> messagesList = [];
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ChatCubit, ChatState>(
      listener: (context, state) {
        if (state is ChatSuccess) messagesList = state.messagesList;
      },
      builder: (context, state) {
        return ListView.builder(
          reverse: true,
          controller: widget.scrollController,
          itemCount: messagesList.length,
          physics: const BouncingScrollPhysics(),
          itemBuilder: (BuildContext context, int index) {
            return messagesList[index].id == widget.email
                ? ChatBubble(
                    message: messagesList[index].message,
                  )
                : SecondChatBubble(message: messagesList[index].message);
          },
        );
      },
    );
  }
}
