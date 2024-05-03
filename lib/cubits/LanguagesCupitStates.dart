// ignore_for_file: camel_case_types

abstract class LanguagesState {}

class LanguagesinitialState extends LanguagesState {}

class LanguagesSuccessState extends LanguagesState {
  final String language;

  LanguagesSuccessState(this.language);
}
