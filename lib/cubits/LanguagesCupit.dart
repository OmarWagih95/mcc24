import 'package:androidstudiommc/cubits/LanguagesCupitStates.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LanguagesCubit extends Cubit<LanguagesState> {
  LanguagesCubit() : super(LanguagesinitialState());
  String lan = 'en';
  void changeLanguages(bool isEnglish) {
    emit(LanguagesLoadingState());
    lan = isEnglish ? 'en' : 'ar';
    emit(LanguagesSuccessState());
  }
}
