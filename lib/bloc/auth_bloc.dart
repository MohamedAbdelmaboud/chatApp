import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitial()) {
    on<AuthEvent>((event, emit) async {
      // on event handler
      // Emitter<AuthState> emit
      if (event is LoginEvent) {
        try {
          emit(LoginLoadingState());
          FirebaseAuth firebaseAuth = FirebaseAuth.instance;
          UserCredential userCredential =
              await firebaseAuth.signInWithEmailAndPassword(
                  email: event.email, password: event.password);
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
      ////////////
      if (event is RegisterEvent) {
        try {
          emit(RegisterLoadingState());
          var auth = FirebaseAuth.instance;
          final UserCredential userCredential =
              await auth.createUserWithEmailAndPassword(
                  email: event.email, password: event.password);
          emit(RegisterSuccessState());
        } on FirebaseAuthException catch (ex) {
          if (ex.code == 'weak-password') {
            emit(
                RegisterFailureState(errorMessage: 'The password is too week'));
          } else if (ex.code == 'email-already-in-use') {
            emit(RegisterFailureState(
                errorMessage: 'The account already exists'));
          } else if (ex.code == 'network-request-failed') {
            emit(RegisterFailureState(errorMessage: 'No internet connection'));
          } else if (ex.code == 'invalid-email') {
            emit(RegisterFailureState(errorMessage: 'invalid-email'));
          }
        } catch (ex) {
          emit(RegisterFailureState(errorMessage: 'Something went Wrong'));
        }
      }
    });
  }
  // @override
  // void onTransition(Transition<AuthEvent, AuthState> transition) {
  //   // TODO: implement onTransition
  //   super.onTransition(transition);
  //   print('----------------------------------------------------------');
  //   print(transition);
  // }
}
