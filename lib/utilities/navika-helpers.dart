import 'dart:core';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:localization/localization.dart';
import 'package:navika/constants.dart';
import 'package:navika/models/enums.dart';
import 'package:navika/models/models.dart';
import 'package:navika/widgets/shared/settings-button.dart';
import 'package:nrs_flutter_lib/constants.dart';
import 'package:nrs_flutter_lib/enums.dart';
import 'package:nrs_flutter_lib/nrs_flutter_lib.dart';

class N {
  static String capitalizeFirstLetter(String str) {
    return '${str[0].toUpperCase()}${str.substring(1).toLowerCase()}';
  }

  static void convertNonMatchingTypes(
      ExerciseTypes exerciseType, PANCombo combo) {
    if (exerciseType == ExerciseTypes.case_nouns) {
      _convertNonMatchingTypes(combo, [GrammarTypes.noun]);
    } else if (exerciseType == ExerciseTypes.case_adjectives) {
      _convertNonMatchingTypes(
          combo, [GrammarTypes.adjective, GrammarTypes.possessivePronoun]);
    } else if (exerciseType == ExerciseTypes.case_nouns_and_adjectives) {
      _convertNonMatchingTypes(combo, [
        GrammarTypes.noun,
        GrammarTypes.adjective,
        GrammarTypes.possessivePronoun,
        GrammarTypes.demonstrativePronoun
      ]);
    } else if (exerciseType == ExerciseTypes.case_personal_pronouns) {
      _convertNonMatchingTypes(combo, [GrammarTypes.personalPronoun]);
    }
  }

  static TextSpan declensionExampleTextSpan(
    String text, {
    Color color = Colors.transparent,
  }) {
    final fontSize = FONT_SIZE - 1;

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

  static DialectType dialectTypeStrToEnum(String strVal) {
    // Legacy support
    if (strVal.toLowerCase() == 'ekavian') {
      return DialectType.Serbia;
    } else if (strVal.toLowerCase() == 'ijekavian') return DialectType.Croatia;

    final matching = DialectType.values
        .firstWhere((DialectType e) => e.name.toString() == strVal);

    return matching;
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
      case 'ono':
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

  static List<TextSpan> getCorrectSentence(
      BuildContext context, List<CaseSentencePart> sentenceParts) {
    final fontSize = FONT_SIZE * 1.1;

    return sentenceParts.map<TextSpan>((CaseSentencePart e) {
      if (sentenceParts.first == e) {
        final displayValue =
            e.displayValue.length > 1 ? e.displayValue : e.correctValues.first;
        e.displayValue = capitalizeFirstLetter(displayValue);
      }

      // If the previous element was correctable, add a space before this one
      if (sentenceParts.indexOf(e) > 0 &&
          sentenceParts[sentenceParts.indexOf(e) - 1].isCorrectable) {
        e.displayValue = ' ${e.displayValue}';
      }

      // If the next element is correctable, add a space
      if (sentenceParts.indexOf(e) < sentenceParts.length - 1 &&
          sentenceParts[sentenceParts.indexOf(e) + 1].isCorrectable) {
        e.displayValue += ' ';
      }

      if (!e.isCorrectable) {
        return TextSpan(
            text: e.displayValue, style: TextStyle(fontSize: fontSize));
      }

      return TextSpan(
          text: '${e.correctValues.join('/')}',
          style: Nrs.getTextStyle(
              context: context, isBold: true, fontSize: fontSize));
    }).toList();
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
        return N.t('masc');
      case Genders.Feminine:
        return N.t('fem');
      case Genders.Neuter:
      case Genders.Unspecific:
        return N.t('neut');
    }
  }

  static String getPronounLabel(PronounEnum pronoun, context) {
    switch (pronoun) {
      case PronounEnum.I:
        return N.t('pronouns_I');
      case PronounEnum.You:
        return N.t('pronouns_You');
      case PronounEnum.He:
        return N.t('pronouns_He');
      case PronounEnum.She:
        return N.t('pronouns_She');
      case PronounEnum.We:
        return N.t('pronouns_We');
      case PronounEnum.You_Plural:
        return N.t('pronouns_You_Pl');
      case PronounEnum.They_Ungendered:
        return N.t('pronouns_They');
      case PronounEnum.They_Masc:
        return N.t('pronouns_They_Mas');
      case PronounEnum.They_Fem:
        return N.t('pronouns_They_Fem');
      case PronounEnum.Oneself:
        return N.t('pronouns_oneself');
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

  static String t(String key, {List<String> inserts = const []}) {
    return key.i18n(inserts);
  }

  static void _convertNonMatchingTypes(
      PANCombo combo, List<GrammarTypes> allowedTypes) {
    for (int i = 0; i < combo.sentenceParts.length; i++) {
      final current = combo.sentenceParts[i];
      final isAllowedGrammarType = allowedTypes.contains(current.grammarType);

      if (current.isCorrectable && !isAllowedGrammarType) {
        var displayValue = i == 0
            ? '${capitalizeFirstLetter(current.correctValues[0])}'
            : ' ${current.correctValues[0]}';

        // If the next element is correctable and not allowed grammar type, add a space
        if (i < combo.sentenceParts.length - 1 &&
            !combo.sentenceParts[i + 1].isCorrectable) {
          displayValue += ' ';
        }

        combo.sentenceParts[i] = CaseSentencePart(displayValue: displayValue);
      }
    }
  }
}
