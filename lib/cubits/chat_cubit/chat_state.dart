import 'package:chat/models/message_model.dart';

class ChatState {}

class ChatInitial extends ChatState {}

class ChatSuccess extends ChatState {
 final List<MessageModel> messagesList ;

  ChatSuccess({required this.messagesList});
}
