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

  /// `Navika`
  String get appTitle {
    return Intl.message(
      'Navika',
      name: 'appTitle',
      desc: '',
      args: [],
    );
  }

  /// `Adjectives`
  String get adjectives {
    return Intl.message(
      'Adjectives',
      name: 'adjectives',
      desc: '',
      args: [],
    );
  }

  /// `Close`
  String get close {
    return Intl.message(
      'Close',
      name: 'close',
      desc: '',
      args: [],
    );
  }

  /// `Pronouns`
  String get pronouns {
    return Intl.message(
      'Pronouns',
      name: 'pronouns',
      desc: '',
      args: [],
    );
  }

  /// `Plural`
  String get plural {
    return Intl.message(
      'Plural',
      name: 'plural',
      desc: '',
      args: [],
    );
  }

  /// `Singular`
  String get singular {
    return Intl.message(
      'Singular',
      name: 'singular',
      desc: '',
      args: [],
    );
  }

  /// `Masculine`
  String get masculine {
    return Intl.message(
      'Masculine',
      name: 'masculine',
      desc: '',
      args: [],
    );
  }

  /// `Feminine`
  String get feminine {
    return Intl.message(
      'Feminine',
      name: 'feminine',
      desc: '',
      args: [],
    );
  }

  /// `Neuter`
  String get neuter {
    return Intl.message(
      'Neuter',
      name: 'neuter',
      desc: '',
      args: [],
    );
  }

  /// `Alive masculine nouns + a, and adjectives + og/eg`
  String get animateNominative {
    return Intl.message(
      'Alive masculine nouns + a, and adjectives + og/eg',
      name: 'animateNominative',
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
      Locale.fromSubtags(languageCode: 'es'),
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
