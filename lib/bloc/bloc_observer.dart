import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

class MyBlocObserver implements BlocObserver {
  @override
  void onChange(BlocBase bloc, Change change) {
    debugPrint('onChange: $change'); // states --> cubit
  }

  @override
  void onClose(BlocBase bloc) {
    debugPrint('onClose: $bloc');
  }

  @override
  void onCreate(BlocBase bloc) {
    debugPrint('onCreate: $bloc');
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    // TODO: implement onError
  }

  @override
  void onEvent(Bloc bloc, Object? event) {
    // TODO: implement onEvent
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    debugPrint('onTransition: $transition'); // states,evnts -->bloc
  }
}
