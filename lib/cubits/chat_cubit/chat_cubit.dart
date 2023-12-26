import 'package:chat/cubits/chat_cubit/chat_state.dart';
import 'package:chat/models/message_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChatCubit extends Cubit<ChatState> {
  ChatCubit() : super(ChatInitial());
  CollectionReference messages =
      FirebaseFirestore.instance.collection('messages');
  void addMessages({required String message, required String email}) {
    messages.add(
      {'message': message, 'createdAt': DateTime.now(), 'id': email},
    );
  }

  displayMessages() {
    messages.orderBy('createdAt', descending: true).snapshots().listen((event) {
  List<MessageModel> messagesList = List.generate(event.docs.length,
          (index) => MessageModel.fromJson(event.docs[index]));
      emit(ChatSuccess(messagesList: messagesList));
    });
  }
}
