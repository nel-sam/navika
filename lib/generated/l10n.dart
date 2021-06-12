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

  /// `Alive/animate masculine nouns in singular get + a, and their adjectives + og/eg. Inanimate objects stay the same as Nominativ`
  String get animateAkusativ {
    return Intl.message(
      'Alive/animate masculine nouns in singular get + a, and their adjectives + og/eg. Inanimate objects stay the same as Nominativ',
      name: 'animateAkusativ',
      desc: '',
      args: [],
    );
  }

  /// `Direct objects are in the accusative case. This case is also used to indicate a point of destination, when there is movement towards the destination.`
  String get akuzativDescription {
    return Intl.message(
      'Direct objects are in the accusative case. This case is also used to indicate a point of destination, when there is movement towards the destination.',
      name: 'akuzativDescription',
      desc: '',
      args: [],
    );
  }

  /// `Using things as tools, means of transport, or using something as a place to go through.`
  String get instrumentalDescription {
    return Intl.message(
      'Using things as tools, means of transport, or using something as a place to go through.',
      name: 'instrumentalDescription',
      desc: '',
      args: [],
    );
  }

  /// `Genitive is used with prepositions and is used to show possession or origin.`
  String get genitiveDescription {
    return Intl.message(
      'Genitive is used with prepositions and is used to show possession or origin.',
      name: 'genitiveDescription',
      desc: '',
      args: [],
    );
  }

  /// `I`
  String get pronouns_I {
    return Intl.message(
      'I',
      name: 'pronouns_I',
      desc: '',
      args: [],
    );
  }

  /// `You`
  String get pronouns_You {
    return Intl.message(
      'You',
      name: 'pronouns_You',
      desc: '',
      args: [],
    );
  }

  /// `He`
  String get pronouns_He {
    return Intl.message(
      'He',
      name: 'pronouns_He',
      desc: '',
      args: [],
    );
  }

  /// `She`
  String get pronouns_She {
    return Intl.message(
      'She',
      name: 'pronouns_She',
      desc: '',
      args: [],
    );
  }

  /// `We`
  String get pronouns_We {
    return Intl.message(
      'We',
      name: 'pronouns_We',
      desc: '',
      args: [],
    );
  }

  /// `You (pl)`
  String get pronouns_You_Pl {
    return Intl.message(
      'You (pl)',
      name: 'pronouns_You_Pl',
      desc: '',
      args: [],
    );
  }

  /// `They (Masc)`
  String get pronouns_They_Mas {
    return Intl.message(
      'They (Masc)',
      name: 'pronouns_They_Mas',
      desc: '',
      args: [],
    );
  }

  /// `They (Fem)`
  String get pronouns_They_Fem {
    return Intl.message(
      'They (Fem)',
      name: 'pronouns_They_Fem',
      desc: '',
      args: [],
    );
  }

  /// `Oneself`
  String get pronouns_oneself {
    return Intl.message(
      'Oneself',
      name: 'pronouns_oneself',
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
