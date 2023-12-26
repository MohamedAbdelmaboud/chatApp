import 'package:chat/constants/assets.dart';
import 'package:chat/constants/constants.dart';
import 'package:chat/cubits/chat_cubit/chat_cubit.dart';
import 'package:chat/widgets/chat_bubbles.dart';
import 'package:chat/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class ChatView extends StatelessWidget {
  ChatView({super.key});
  static String id = 'ChatView';
  final TextEditingController controller = TextEditingController();
  final ScrollController scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    dynamic email = ModalRoute.of(context)!.settings.arguments;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: mainColor,
        title: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          Image.asset(
            Assets.assetsImagesChatIcon,
            height: 37,
          ),
          const SizedBox(
            width: 10,
          ),
          const CustomText(
            'Chat',
            fontWeight: FontWeight.bold,
          ).pacifico(),
        ]),
      ),
      body: Column(
        children: [
          Expanded(
            child: ChatBubbles(
              scrollController: scrollController,
              email: email,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.80,
                  height: 50,
                  child: TextField(
                    textInputAction: TextInputAction.done,
                    textAlignVertical: TextAlignVertical.bottom,
                    controller: controller,
                    decoration: InputDecoration(
                      hintText: 'Send Massages',
                      hintStyle: GoogleFonts.montserrat(),
                      border: inputBorder(),
                      enabledBorder: inputBorder(),
                      focusedBorder: inputBorder(),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 6,
                ),
                FloatingActionButton(
                  onPressed: () {
                    String message = controller.text;
                    BlocProvider.of<ChatCubit>(context)
                        .addMessages(message: message, email: email);
                    controller.clear();
                    scrollController.animateTo(0,
                        duration: const Duration(microseconds: 500),
                        curve: Curves.easeIn);
                  },
                  backgroundColor: mainColor,
                  child: const Icon(Icons.send_rounded),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  OutlineInputBorder inputBorder() {
    return OutlineInputBorder(
        borderRadius: BorderRadius.circular(99),
        borderSide: const BorderSide(width: 2, color: mainColor));
  }
}
