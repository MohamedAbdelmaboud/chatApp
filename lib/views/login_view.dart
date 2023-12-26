import 'package:chat/bloc/auth_bloc.dart';
import 'package:chat/constants/assets.dart';
import 'package:chat/constants/constants.dart';
import 'package:chat/cubits/chat_cubit/chat_cubit.dart';
import 'package:chat/views/chat_view.dart';
import 'package:chat/views/register_view.dart';
import 'package:chat/widgets/custom_field.dart';
import 'package:chat/widgets/custom_text.dart';
import 'package:chat/widgets/my_button.dart';
import 'package:chat/widgets/snake_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});
  static String id = 'LoginView';

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  String? email;

  String? password;

  bool isLoading = false;

  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: BlocConsumer<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is LoginLoadingState) {
            isLoading = true;
          } else if (state is LoginFailureState) {
            isLoading = false;
            showSnakeBar(context, state.errorMessage, isError: true);
          } else {
            isLoading = false;
            BlocProvider.of<ChatCubit>(context).displayMessages();
            showSnakeBar(context, 'Login done successfully !', isError: false);
            Navigator.pushNamed(context, ChatView.id, arguments: email);
          }
        },
        builder: (context, state) {
          return Form(
            key: formKey,
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Lottie.asset(Assets.assetsImagesAnimationLnv7ch76,
                      height: 250),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Row(
                      children: [
                        const CustomText(
                          'Login',
                          color: mainColor,
                        ).pacifico(),
                      ],
                    ),
                  ),
                  CustomField(
                      validator: (value) {
                        if (value!.isEmpty) return 'Enter a valid Email';
                        return null;
                      },
                      onChanged: (data) {
                        email = data;
                      },
                      hintText: 'Enter Your Email',
                      labelText: 'Email'),
                  CustomField(
                    validator: (value) {
                      if (value!.isEmpty) return 'Enter a valid Password';
                      return null;
                    },
                    onChanged: (data) {
                      password = data;
                    },
                    hintText: 'Enter Your Password',
                    labelText: 'Password',
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: MyButton(
                      isLoading: isLoading,
                      text: 'Login',
                      onPressed: () async {
                        if (formKey.currentState!.validate()) {
                          BlocProvider.of<AuthBloc>(context).add(LoginEvent(email: email!, password: password!));
                        }
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const CustomText(
                          "don't have an account?",
                          fontSize: 14,
                          color: mainColor,
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.pushNamed(context, RegisterView.id);
                          },
                          child: const CustomText(
                            "Register",
                            fontWeight: FontWeight.bold,
                            color: Colors.blue,
                            fontSize: 14,
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
