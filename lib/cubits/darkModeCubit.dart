import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';

abstract class Dark_lightModeState {}

class initialtModeState extends Dark_lightModeState {}

class DarkModeState extends Dark_lightModeState {}

class LightModeState extends Dark_lightModeState {}

class Dark_lightModeCubit extends Cubit<Dark_lightModeState> {
  Dark_lightModeCubit() : super(initialtModeState());
  String mode = 'light';
  void darkAndlightMode(String onpressMode) {
    if (onpressMode == 'light') {
      emit(LightModeState());
      log('light from cubit');
      mode = 'light';
    } else {
      emit(DarkModeState());
      log('dark from cubit');
      mode = 'dark';
    }
  }
}
