import 'dart:math';

import 'package:flutter/material.dart';
import 'package:navika/constants.dart';
import 'package:navika/models/adjective.dart';
import 'package:navika/models/enums.dart';
import 'package:navika/models/models.dart';
import 'package:navika/models/noun.dart';
import 'package:navika/models/personal-pronoun.dart';
import 'package:navika/widgets/shared/pan-list-item.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class N {
  static scrollTo(double point, controller) {
    controller.animateTo(point,
        curve: Curves.linear, duration: SCROLL_DURATION);
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

  static List<T> shuffleList<T>(List<T> items) {
    var random = new Random();

    for (var i = items.length - 1; i > 0; i--) {
      var n = random.nextInt(i + 1);
      var temp = items[i];
      items[i] = items[n];
      items[n] = temp;
    }

    return items;
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
    return darkModeOn ? const Color(0xFF212121) : Colors.white;
  }

  static List<PANExerciseItem> getPANCombos(
      WordBank bank,
      StaticSentenceParts Function(Noun, bool, Adjective)
          getStaticSentenceParts,
      StaticSentenceParts Function(PersonalPronoun, bool)
          getPersonalPronounSentenceStaticParts) {
    var listItems = List<PANExerciseItem>.empty(growable: true);

    bank.personalPronouns.forEach((persPronoun) {
      final isPlural = persPronoun.isPlural;
      final staticParts =
          getPersonalPronounSentenceStaticParts(persPronoun, isPlural);

      listItems.add(PANExerciseItem(
        sentenceStarter: staticParts.start,
        sentenceEnder: staticParts.end,
        gender: persPronoun.gender,
        isPlural: isPlural,
        personalPronoun: persPronoun,
        usePersonalPronounShortForm: N.coinFlip(),
      ));
    });

    bank.possessivePronouns.forEach((possPronoun) {
      bank.adjectives.forEach((adj) {
        bank.nouns.forEach((noun) {
          final isPlural = noun.nominativ.plural != '' && N.coinFlip();
          final staticParts =
              getStaticSentenceParts(noun, isPlural, possPronoun);

          listItems.add(PANExerciseItem(
              sentenceStarter: staticParts.start,
              sentenceEnder: staticParts.end,
              pronoun: possPronoun,
              adjective: adj,
              gender: noun.gender,
              isPlural: isPlural,
              noun: noun));
        });
      });
    });

    return listItems;
  }

  static List<PANListItem> getPANListItems(
      List<PANExerciseItem> listItems, CaseTypeEnum caseType) {
    return N
        .shuffleList<PANExerciseItem>(listItems)
        .take(BATCH_COUNT)
        .map((PANExerciseItem e) {
      if (e.personalPronoun != null) {
        final correctPersonalPronounValue = e.personalPronoun!.getDeclension(
            caseType: caseType, isShortForm: e.usePersonalPronounShortForm);

        return PANListItem(
          sentenceStarter: e.sentenceStarter,
          sentenceEnder: e.sentenceEnder,
          correctPersonalPronounValue: correctPersonalPronounValue,
          activePersonalPronounValue: e.personalPronoun!
              .getRandomDeclension(correctPersonalPronounValue),
          isPlural: e.isPlural,
          gender: e.gender,
          personalPronoun: e.personalPronoun!,
        );
      }

      final includePossPronoun = N.coinFlip();
      final includeAdjective = N.coinFlip();

      final correctNounValue = e.noun!.getDeclension(e.isPlural, caseType);
      final correctPronounValue = includePossPronoun
          ? e.pronoun!
              .getDeclension(e.gender, e.isPlural, caseType, e.noun!.isAnimate)
          : '';
      final correctAdjValue = includeAdjective
          ? e.adjective!
              .getDeclension(e.gender, e.isPlural, caseType, e.noun!.isAnimate)
          : '';

      return PANListItem(
          sentenceStarter: e.sentenceStarter,
          sentenceEnder: e.sentenceEnder,
          correctPossPronounValue: correctPronounValue,
          correctAdjValue: correctAdjValue,
          correctNounValue: correctNounValue,
          adjective: e.adjective!,
          activePossPronounValue: includePossPronoun
              ? e.pronoun!.getRandomDeclension(correctPronounValue)
              : '',
          activeAdjValue: includeAdjective
              ? e.adjective!.getRandomDeclension(correctAdjValue)
              : '',
          activeNounValue: e.noun!.getRandomDeclension(correctNounValue),
          isPlural: e.isPlural,
          possPronoun: e.pronoun!,
          gender: e.gender,
          noun: e.noun!);
    }).toList();
  }

  static getRandomTense() {
    final tenses = TenseEnum.values;
    var index = (new Random()).nextInt(tenses.length - 1);
    return tenses[index];
  }

  // ignore: non_constant_identifier_names
  static AppBar NavikaAppBar(
      Widget title, BuildContext context, List<Widget> actions) {
    return AppBar(
      elevation: APPBAR_ELEVATION,
      backgroundColor: N.getAppBarColor(context),
      textTheme: N.getAppBarTextTheme(context),
      iconTheme: N.getAppBarIconTheme(context),
      title: title,
      actions: actions,
    );
  }

  // ignore: non_constant_identifier_names
  static TextSpan NTextSpan(String text,
      {bool isBold = false,
      bool isItalic = false,
      Color color = Colors.transparent}) {
    var textStyle;

    if (isBold && isItalic && color != Colors.transparent) {
      textStyle = TextStyle(
        color: color,
        fontWeight: FontWeight.bold,
        fontStyle: FontStyle.italic,
      );
    } else if (isItalic && color != Colors.transparent) {
      textStyle = TextStyle(
        color: color,
        fontStyle: FontStyle.italic,
      );
    } else if (isBold && color != Colors.transparent) {
      textStyle = TextStyle(
        color: color,
        fontWeight: FontWeight.bold,
      );
    } else if (isBold) {
      textStyle = TextStyle(
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

  static String getBitiConjugationForPronoun(String pronoun) {
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
}
