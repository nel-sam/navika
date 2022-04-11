import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:navika/constants.dart';
import 'package:navika/models/enums.dart';
import 'package:navika/models/models.dart';
import 'package:navika/widgets/shared/settings-button.dart';
import 'package:nrs_flutter_lib/constants.dart';
import 'package:nrs_flutter_lib/enums.dart';
import 'package:nrs_flutter_lib/nrs_flutter_lib.dart';

class N {
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

  static TextSpan declensionExampleTextSpan(
    String text, {
    Color color = Colors.transparent,
  }) {
    final fontSize = FONT_SIZE;

    if (color != Colors.transparent) {
      return TextSpan(
          text: text,
          style: TextStyle(
            fontSize: fontSize,
            color: color,
          ));
    }

    return TextSpan(text: text, style: TextStyle(fontSize: fontSize));
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

  static String getCaseLabel(Cases caseType) {
    switch (caseType) {
      case Cases.All:
        return 'Sve padeže';
      case Cases.Nom:
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

  static getRandomTense() {
    final tenses = TenseEnum.values;
    var index = (new Random()).nextInt(tenses.length - 1);
    return tenses[index];
  }

  static int longestFromList(List<String> values) {
    int longestFound = 0;

    values.forEach((e) {
      if (e.length > longestFound) longestFound = e.length;
    });
    return longestFound;
  }

  static navAppBar(
      {required BuildContext context,
      String title = '',
      String transTitle = '',
      bool showSettingsButton = true}) {
    return Nrs.NrsAppBar(
        context: context,
        title: title,
        transTitle: transTitle,
        actions: [if (showSettingsButton) SettingsButton()]);
  }
}
