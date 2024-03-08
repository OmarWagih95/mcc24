import 'package:flutter_bloc/flutter_bloc.dart';
import 'visibilityCubitStates.dart';

class VisibilityCubit extends Cubit<VisibilityState> {
  VisibilityCubit() : super(VisibilityState(true));

  void toggleVisibility() {
    emit(VisibilityState(!state.isVisible));
  }
}
