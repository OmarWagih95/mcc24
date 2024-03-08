// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `skip`
  String get skip {
    return Intl.message(
      'skip',
      name: 'skip',
      desc: '',
      args: [],
    );
  }

  /// `Choose your service easily`
  String get Choose_your_service_easily {
    return Intl.message(
      'Choose your service easily',
      name: 'Choose_your_service_easily',
      desc: '',
      args: [],
    );
  }

  /// `Describe your request`
  String get Describe_your_request {
    return Intl.message(
      'Describe your request',
      name: 'Describe_your_request',
      desc: '',
      args: [],
    );
  }

  /// `Select the best offer for you`
  String get Select_the_best_offer_for_you {
    return Intl.message(
      'Select the best offer for you',
      name: 'Select_the_best_offer_for_you',
      desc: '',
      args: [],
    );
  }

  /// `Complete the service and raten\n the service provider`
  String get Complete_the_service_and_rate_the_service_provider {
    return Intl.message(
      'Complete the service and raten\n the service provider',
      name: 'Complete_the_service_and_rate_the_service_provider',
      desc: '',
      args: [],
    );
  }

  /// `continue`
  String get Continue {
    return Intl.message(
      'continue',
      name: 'Continue',
      desc: '',
      args: [],
    );
  }

  /// `General contracting`
  String get General_contracting {
    return Intl.message(
      'General contracting',
      name: 'General_contracting',
      desc: '',
      args: [],
    );
  }

  /// `General interior design and finishes`
  String get General_interior_design_and_finishes {
    return Intl.message(
      'General interior design and finishes',
      name: 'General_interior_design_and_finishes',
      desc: '',
      args: [],
    );
  }

  /// `General maintenance and renovation`
  String get General_maintenance_and_renovation {
    return Intl.message(
      'General maintenance and renovation',
      name: 'General_maintenance_and_renovation',
      desc: '',
      args: [],
    );
  }

  /// `choose maintenance service`
  String get choose_maintenance_service {
    return Intl.message(
      'choose maintenance service',
      name: 'choose_maintenance_service',
      desc: '',
      args: [],
    );
  }

  /// `then get best prices from our suppliers`
  String get then_get_best_prices_from_our_suppliers {
    return Intl.message(
      'then get best prices from our suppliers',
      name: 'then_get_best_prices_from_our_suppliers',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'ar'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
