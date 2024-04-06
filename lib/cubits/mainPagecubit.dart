import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

abstract class BottomNavigationState extends Equatable {
  const BottomNavigationState();

  @override
  List<Object> get props => [];
}

class BottomNavigationInitial extends BottomNavigationState {
  final int currentIndex;

  BottomNavigationInitial(this.currentIndex);
}

class BottomNavigationChange extends BottomNavigationState {
  final int currentIndex;

  const BottomNavigationChange(this.currentIndex);

  @override
  List<Object> get props => [currentIndex];
}

class BottomNavigationCubit extends Cubit<BottomNavigationState> {
  BottomNavigationCubit(int initialIndex) : super(BottomNavigationInitial(0));

  void changeIndex(int newIndex) => emit(BottomNavigationChange(newIndex));
}
