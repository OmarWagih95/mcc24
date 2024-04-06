// ignore_for_file: camel_case_types

part of 'base_bloc.dart';

@immutable
abstract class landingPageState {
  final int tabIndex;

  const landingPageState({required this.tabIndex});
}

class navigationPageinitialState extends landingPageState {
  const navigationPageinitialState({required super.tabIndex});
}
