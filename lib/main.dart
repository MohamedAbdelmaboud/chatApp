import 'package:chat/cubits/chat_cubit/chat_cubit.dart';
import 'package:chat/cubits/login_cubit/login_cubit.dart';
import 'package:chat/cubits/register_cubit/register_cubit.dart';
import 'package:chat/firebase_options.dart';
import 'package:chat/views/chat_view.dart';
import 'package:chat/views/login_view.dart';
import 'package:chat/views/register_view.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => LoginCubit(),
        ),
        BlocProvider(
          create: (context) => RegisterCubit(),
        ),
        BlocProvider(
          create: (context) => ChatCubit(),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: LoginView.id,
        routes: {
          LoginView.id: (context) => const LoginView(),
          RegisterView.id: (context) => const RegisterView(),
          ChatView.id: (context) => ChatView(),
        },
      ),
    );
  }
}