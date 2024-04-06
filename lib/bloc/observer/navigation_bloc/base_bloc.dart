import 'package:MCC/views/navpages/main_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'base_event.dart';
part 'base_state.dart';

class LandingpageBloc extends Bloc<landingPageEvent, landingPageState> {
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  static LandingpageBloc get(context) => BlocProvider.of(context);
  LandingpageBloc() : super(navigationPageinitialState(tabIndex: 0)) {
    on<landingPageEvent>((event, emit) {
      if (event is tabindexevent) {
        emit(navigationPageinitialState(tabIndex: event.tabindex));
      }
    });
    currentPage;
  }
}
