import 'dart:math';

import 'package:flutter/material.dart';
import 'package:navika/constants.dart';
import 'package:navika/models/adjective.dart';
import 'package:navika/models/enums.dart';
import 'package:navika/models/models.dart';
import 'package:navika/models/noun.dart';
import 'package:navika/models/personal-pronoun.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:navika/state/cases/case-question-state.dart';
import 'package:navika/extensions.dart';

class N {
  static scrollTo(double point, controller) {
    controller.animateTo(point,
        curve: Curves.linearToEaseOut, duration: SCROLL_DURATION);
  }

  static getRandomTense() {
    final tenses = TenseEnum.values;
    var index = (new Random()).nextInt(tenses.length - 1);
    return tenses[index];
  }

  // ignore: non_constant_identifier_names
  static AppBar NavikaAppBar({
    required String title,
    String transTitle = '',
    required BuildContext context,
  }) {
    return AppBar(
      elevation: APPBAR_ELEVATION,
      backgroundColor: N.getAppBarColor(context),
      iconTheme: N.getAppBarIconTheme(context),
      title: transTitle == ''
          ? Text('$title', style: HEADER_TEXT_STYLE)
          : Text('$title - $transTitle', style: HEADER_TEXT_STYLE),
    );
  }

  static IconData getGenderIcon(Genders gender) {
    if (gender == Genders.Feminine) {
      return FEMININE_ICON;
    } else if (gender == Genders.Masculine) {
      return MASCULINE_ICON;
    } else {
      return NEUTER_ICON;
    }
  }

  static String getGenderString(BuildContext context, Genders gender) {
    switch (gender) {
      case Genders.Masculine:
        return AppLocalizations.of(context)!.masculine;
      case Genders.Feminine:
        return AppLocalizations.of(context)!.feminine;
      case Genders.Neuter:
      case Genders.Unspecific:
        return AppLocalizations.of(context)!.neuter;
    }
  }

  static int getRandomNumber({int min = 0, int max = 99999}) {
    var random = new Random();
    return random.nextInt(max - min) + min;
  }

  static bool coinFlip() {
    var result = (new Random()).nextInt(4) % 2 == 0;
    return result;
  }

  static List<DropdownMenuItem<String>> getDropdownItems({
    PersonalPronoun? personalPronoun,
    Noun? noun,
    Adjective? adjective,
  }) {
    List<String> items = List<String>.empty(growable: true);

    if (personalPronoun != null)
      items = personalPronoun.getUniqueDeclensions();
    else if (noun != null)
      items = noun.getUniqueDeclensions();
    else
      items = adjective!.getUniqueDeclensions();

    return items
        .map((e) => DropdownMenuItem<String>(
              value: e,
              child: Text(e),
            ))
        .toList();
  }

  static bool isDarkTheme(BuildContext context) {
    return MediaQuery.of(context).platformBrightness == Brightness.dark;
  }

  static TextTheme getAppBarTextTheme(BuildContext context) {
    return isDarkTheme(context)
        ? APP_BAR_TEXTTHEME_DARK
        : APP_BAR_TEXTTHEME_LIGHT;
  }

  static IconThemeData getAppBarIconTheme(BuildContext context) {
    return isDarkTheme(context)
        ? APP_BAR_ICONTHEME_DARK
        : APP_BAR_ICONTHEME_LIGHT;
  }

  static Color getAppBarColor(BuildContext context) {
    var brightness = MediaQuery.of(context).platformBrightness;
    bool darkModeOn = brightness == Brightness.dark;
    return darkModeOn
        ? Color.fromARGB(255, 48, 48, 48)
        : Color.fromARGB(255, 250, 250, 250);
  }

  static PANCombo getPANCombos(
      {required Cases caseType,
      required WordBank bank,
      required StaticSentenceParts Function(Noun, bool, Adjective?, Adjective?)
          getStaticSentenceParts,
      required StaticSentenceParts Function(PersonalPronoun, bool)
          getPersonalPronounSentenceStaticParts}) {
    if (caseType == Cases.Vok) {
      final noun = bank.nouns[N.getRandomNumber(max: bank.nouns.length)];
      final staticParts = getStaticSentenceParts(noun, false, null, null);

      return PANCombo(
          caseType: caseType,
          sentenceStarter: staticParts.start,
          sentenceEnder: staticParts.end,
          possPronoun: null,
          adjective: null,
          gender: noun.gender,
          isPlural: false,
          noun: noun);
    }

    final maxRandom = bank.personalPronouns.length == 0 ? 2 : 3;
    var exType = N.getRandomNumber(max: maxRandom);

    if (exType == 0) {
      final possPronoun = bank.possessivePronouns.length == 0
          ? null
          : bank.possessivePronouns[
              N.getRandomNumber(max: bank.possessivePronouns.length)];
      final adj =
          bank.adjectives[N.getRandomNumber(max: bank.adjectives.length)];
      final noun = bank.nouns[N.getRandomNumber(max: bank.nouns.length)];
      final isPlural = noun.nominativ.plural.first != '' && N.coinFlip();
      final staticParts =
          getStaticSentenceParts(noun, isPlural, possPronoun, adj);

      return PANCombo(
          caseType: caseType,
          sentenceStarter: staticParts.start,
          sentenceEnder: staticParts.end,
          possPronoun: possPronoun,
          adjective: adj,
          gender: noun.gender,
          isPlural: isPlural,
          noun: noun);
    } else if (exType == 1) {
      final noun = bank.nouns[N.getRandomNumber(max: bank.nouns.length)];
      final isPlural = noun.nominativ.plural.first != '' && N.coinFlip();
      final staticParts = getStaticSentenceParts(noun, isPlural, null, null);

      return PANCombo(
          caseType: caseType,
          sentenceStarter: staticParts.start,
          sentenceEnder: staticParts.end,
          possPronoun: null,
          adjective: null,
          gender: noun.gender,
          isPlural: isPlural,
          noun: noun);
    } else {
      final persPronoun = bank.personalPronouns[
          N.getRandomNumber(max: bank.personalPronouns.length)];
      final isPlural = persPronoun.isPlural;
      final staticParts =
          getPersonalPronounSentenceStaticParts(persPronoun, isPlural);

      return PANCombo(
        caseType: caseType,
        sentenceStarter: staticParts.start,
        sentenceEnder: staticParts.end,
        gender: persPronoun.gender,
        isPlural: isPlural,
        personalPronoun: persPronoun,
        usePersonalPronounShortForm: N.coinFlip(),
      );
    }
  }

  // ignore: non_constant_identifier_names
  static TextSpan NTextSpan(String text,
      {bool isBold = false,
      bool isItalic = false,
      double fontSize = 13,
      Color color = Colors.transparent}) {
    var textStyle;

    if (isBold && isItalic && color != Colors.transparent) {
      textStyle = TextStyle(
        color: color,
        fontSize: fontSize,
        fontWeight: FontWeight.bold,
        fontStyle: FontStyle.italic,
      );
    } else if (isItalic && color != Colors.transparent) {
      textStyle = TextStyle(
        color: color,
        fontSize: fontSize,
        fontStyle: FontStyle.italic,
      );
    } else if (isBold) {
      textStyle = TextStyle(
        color: ACCENT_COLOR,
        fontSize: fontSize,
        fontWeight: FontWeight.bold,
      );
    }

    return TextSpan(text: text, style: textStyle);
  }

  static String getPronounLabel(PronounEnum pronoun, context) {
    switch (pronoun) {
      case PronounEnum.I:
        return AppLocalizations.of(context)!.pronouns_I;
      case PronounEnum.You:
        return AppLocalizations.of(context)!.pronouns_You;
      case PronounEnum.He:
        return AppLocalizations.of(context)!.pronouns_He;
      case PronounEnum.She:
        return AppLocalizations.of(context)!.pronouns_She;
      case PronounEnum.We:
        return AppLocalizations.of(context)!.pronouns_We;
      case PronounEnum.You_Plural:
        return AppLocalizations.of(context)!.pronouns_You_Pl;
      case PronounEnum.They_Ungendered:
        return AppLocalizations.of(context)!.pronouns_They;
      case PronounEnum.They_Masc:
        return AppLocalizations.of(context)!.pronouns_They_Mas;
      case PronounEnum.They_Fem:
        return AppLocalizations.of(context)!.pronouns_They_Fem;
      case PronounEnum.Oneself:
        return AppLocalizations.of(context)!.pronouns_oneself;
    }
  }

  static int longestFromList(List<String> values) {
    int longestFound = 0;

    values.forEach((e) {
      if (e.length > longestFound) longestFound = e.length;
    });
    return longestFound;
  }

  static String getCaseLabel(Cases caseType) {
    switch (caseType) {
      case Cases.Nom:
      case Cases.All:
        return 'Nominativ';
      case Cases.Ins:
        return 'Instrumental';
      case Cases.Aku:
        return 'Akuzativ';
      case Cases.Vok:
        return 'Vokativ';
      case Cases.Lok:
        return 'Lokativ';
      case Cases.Gen:
        return 'Genitiv';
      case Cases.Dat:
        return 'Dativ';
    }
  }

  static String getBitiConjugation(String pronoun) {
    switch (pronoun) {
      case 'ja':
        return 'sam';
      case 'ti':
        return 'si';
      case 'mi':
        return 'smo';
      case 'vi':
        return 'ste';
      case 'on':
      case 'ona':
        return 'je';
      case 'oni':
      case 'one':
        return 'su';
      default:
        return '';
    }
  }

  static double getScreenWidth(BuildContext context) {
    return MediaQuery.of(context).size.width;
  }

  static double getScreenHeight(BuildContext context) {
    return MediaQuery.of(context).size.height;
  }

  static fontStyleNormal({double fontSize = FONT_SIZE}) {
    return TextStyle(
      fontSize: fontSize,
      fontStyle: FontStyle.normal,
    );
  }

  static TextStyle fontStyleBold({double fontSize = FONT_SIZE}) {
    return TextStyle(
      color: ACCENT_COLOR,
      fontSize: fontSize,
      fontWeight: FontWeight.bold,
    );
  }

  static bool containsCaseQuestionState(List list, PANCombo item) {
    if (list.isEmpty) return false;

    for (int i = 0; i < list.length; i++) {
      var testItem = list[i].combos;

      if (testItem.noun?.dictionary.toString() == item.noun?.dictionary &&
          testItem.personalPronoun?.nominativ.forms[0].toString() ==
              item.personalPronoun?.nominativ.forms[0] &&
          testItem.possPronoun?.dictionary.toString() ==
              item.possPronoun?.dictionary &&
          testItem.adjective?.dictionary.toString() ==
              item.adjective?.dictionary) {
        return true;
      }
    }

    return false;
  }

  static bool containsCaseQuestionState___(List list, PANCombo item) {
    if (list.isEmpty) return false;

    if (item.personalPronoun != null) {
      final strList = list
          .where((e) => e.combos.personalPronoun != null)
          .map((e) => e.combos.personalPronoun!.nominativ.forms[0].toString())
          .toList();

      final contains = strList
          .containsCaseInsensitive(item.personalPronoun!.nominativ.forms[0]);

      if (contains) return true;
    }
    if (item.possPronoun != null) {
      final strList = list
          .where((e) => e.combos.possPronoun != null)
          .map((e) => e.combos.possPronoun!.dictionary.toString())
          .toList();

      final contains =
          strList.containsCaseInsensitive(item.possPronoun!.dictionary);

      if (contains) return true;
    }
    if (item.adjective != null) {
      final strList = list
          .where((e) => e.combos.adjective != null)
          .map((e) => e.combos.adjective!.dictionary.toString())
          .toList();

      final contains =
          strList.containsCaseInsensitive(item.adjective!.dictionary);

      if (contains) return true;
    }
    if (item.noun != null) {
      final strList = list
          .where((e) => e.combos.noun != null)
          .map((e) => e.combos.noun!.dictionary.toString())
          .toList();

      final contains = strList.containsCaseInsensitive(item.noun!.dictionary);

      if (contains) return true;
    }

    return false;
  }
}
