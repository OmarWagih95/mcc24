// ignore_for_file: camel_case_types

import 'package:equatable/equatable.dart';

abstract class LanguagesState {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class LanguagesinitialState extends LanguagesState {

  LanguagesinitialState();
}

class LanguagesLoadingState extends LanguagesState {}

class LanguagesSuccessState extends LanguagesState {}
