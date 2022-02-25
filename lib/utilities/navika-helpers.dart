import 'dart:math';

import 'package:flutter/material.dart';
import 'package:navika/constants.dart';
import 'package:navika/models/enums.dart';
import 'package:navika/models/models.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class N {
  static getRandomTense() {
    final tenses = TenseEnum.values;
    var index = (new Random()).nextInt(tenses.length - 1);
    return tenses[index];
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

  static double getScreenWidth({bool halfWidth = false, int reduction = 0}) {
    final width =
        MediaQueryData.fromWindow(WidgetsBinding.instance.window).size.width;
    return (halfWidth ? width / 2 : width) - reduction;
  }

  static double getScreenHeight() {
    return MediaQueryData.fromWindow(WidgetsBinding.instance.window)
        .size
        .height;
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
}
