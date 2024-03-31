import 'package:MCC/cubits/LanguagesCupitStates.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LanguagesCubit extends Cubit<LanguagesState> {
  LanguagesCubit() : super(LanguagesinitialState());
  // String lan = 'en';
  void changeLanguages(String lang) {
    if (lang == 'en') {
      // lan = 'en';
      emit(LanguagesSuccessState('en'));
    } else {
      // lan = 'ar';
      emit(LanguagesSuccessState('ar'));
    }
  }

  // void toggleLanguage() {
  //   // emit(state);
  // }
}
