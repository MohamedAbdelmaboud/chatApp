import 'package:chat/cubits/register_cubit/register_state.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit() : super(RegisterIntialState());
  Future<void> createUser(
      {required String email, required String password}) async {
    try {
      emit(RegisterLoadingState());
      var auth = FirebaseAuth.instance;
      final UserCredential userCredential = await auth
          .createUserWithEmailAndPassword(email: email, password: password);
      emit(RegisterSuccessState());
    } on FirebaseAuthException catch (ex) {
      if (ex.code == 'weak-password') {
        emit(RegisterFailureState(errorMessage: 'The password is too week'));
      } else if (ex.code == 'email-already-in-use') {
        emit(RegisterFailureState(errorMessage: 'The account already exists'));
      } else if (ex.code == 'network-request-failed') {
        emit(RegisterFailureState(errorMessage: 'No internet connection'));
      } else if (ex.code == 'invalid-email') {
        emit(RegisterFailureState(errorMessage: 'invalid-email'));
      }
    } catch (ex) {
      emit(RegisterFailureState(errorMessage: 'Something went Wrong'));
    }
  }
}
