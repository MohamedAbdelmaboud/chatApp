import 'package:chat/bloc/auth_bloc.dart';
import 'package:chat/constants/assets.dart';
import 'package:chat/constants/constants.dart';
import 'package:chat/widgets/custom_field.dart';
import 'package:chat/widgets/custom_text.dart';
import 'package:chat/widgets/my_button.dart';
import 'package:chat/widgets/snake_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({super.key});
  static String id = 'RegisterView';

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  String? email;

  String? password;

  bool isLoading = false;

  var fromKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      // backgroundColor: MyColors.mainColor.withOpacity(0.5),
      body: BlocConsumer<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is RegisterLoadingState) {
            isLoading = true;
          } else if (state is RegisterFailureState) {
            isLoading = false;
            showSnakeBar(context, state.errorMessage, isError: true);
          } else {
            isLoading = false;
            showSnakeBar(context, 'User Created successfuly', isError: false);
            Navigator.pop(context);
          }
        },
        builder: (context, state) {
          return Form(
            key: fromKey,
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Lottie.asset(Assets.assetsImagesRegister, height: 300),
                  Row(
                    children: [
                      const CustomText(
                        'Register',
                        color: mainColor,
                      ).pacifico(),
                    ],
                  ),
                  CustomField(
                      validator: (value) {
                        if (value!.isEmpty) return 'Enter a valid Email';
                      },
                      onChanged: (data) {
                        email = data;
                      },
                      hintText: 'Enter Your Email',
                      labelText: 'Email'),
                  CustomField(
                    validator: (value) {
                      if (value!.isEmpty) return 'Enter a valid Password';
                    },
                    onChanged: (data) {
                      password = data;
                    },
                    hintText: 'Enter Your Password',
                    labelText: 'Password',
                  ),
                  MyButton(
                    isLoading: isLoading,
                    text: 'Register',
                    onPressed: () async {
                      if (fromKey.currentState!.validate()) {
                        BlocProvider.of<AuthBloc>(context).add(
                            RegisterEvent(email: email!, password: password!));
                      }
                    },
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const CustomText(
                          "Already have an account?",
                          fontSize: 14,
                          color: mainColor,
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: const CustomText(
                            "Login",
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
