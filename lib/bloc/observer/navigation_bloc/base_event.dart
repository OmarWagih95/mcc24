part of 'base_bloc.dart';

@immutable
abstract class landingPageEvent {}

class tabindexevent extends landingPageEvent {
  final int tabindex;
  tabindexevent({required this.tabindex});
}
