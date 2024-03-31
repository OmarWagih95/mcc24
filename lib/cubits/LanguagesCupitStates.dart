// ignore_for_file: camel_case_types

import 'package:equatable/equatable.dart';

abstract class LanguagesState {

}

class LanguagesinitialState extends LanguagesState {

}

class LanguagesSuccessState extends LanguagesState {
  final String language;

  LanguagesSuccessState(this.language);

}
