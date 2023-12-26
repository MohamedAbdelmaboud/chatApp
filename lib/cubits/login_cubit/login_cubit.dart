import 'package:chat/cubits/login_cubit/login_state.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginIntialState());
  Future login({required String email, required String password}) async {
    try {
      emit(LoginLoadingState());
      FirebaseAuth firebaseAuth = FirebaseAuth.instance;
      UserCredential userCredential = await firebaseAuth
          .signInWithEmailAndPassword(email: email, password: password);
      emit(LoginSuccessState());
    } on FirebaseAuthException catch (ex) {
      if (ex.code == 'invalid-login-credentials') {
        emit(LoginFailureState(errorMessage: 'User not found'));
      } else if (ex.code == 'invalid-email') {
        emit(LoginFailureState(errorMessage: 'Invalid email'));
      } else if (ex.code == 'wrong-password') {
        emit(LoginFailureState(errorMessage: 'Wrong password'));
      } else if (ex.code == 'network-request-failed') {
        emit(LoginFailureState(errorMessage: 'No internet connection'));
      } else {
        emit(LoginFailureState(errorMessage: 'something went wrong !'));
      }
    } catch (e) {
      emit(LoginFailureState(errorMessage: 'something went wrong !'));
    }
  }
}
