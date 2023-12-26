import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

class MyBlocObserver implements BlocObserver {
  @override
  void onChange(BlocBase bloc, Change change) {
    debugPrint('---------------------------------------------------');
    debugPrint('onChange: $change'); // states --> cubit
    debugPrint('---------------------------------------------------');
  }

  @override
  void onClose(BlocBase bloc) {
    debugPrint('---------------------------------------------------');
    debugPrint('onClose: $bloc');
    debugPrint('---------------------------------------------------');
  }

  @override
  void onCreate(BlocBase bloc) {
    debugPrint('---------------------------------------------------');
    debugPrint('onCreate: $bloc');
    debugPrint('---------------------------------------------------');
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
    debugPrint('---------------------------------------------------');
    debugPrint('onTransition: $transition'); // states,evnts -->bloc
    debugPrint('---------------------------------------------------');
  }
}
