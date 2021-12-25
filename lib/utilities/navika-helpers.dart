import 'dart:math';

import 'package:flutter/material.dart';
import 'package:navika/constants.dart';
import 'package:navika/models/adjective.dart';
import 'package:navika/models/enums.dart';
import 'package:navika/models/models.dart';
import 'package:navika/models/noun.dart';
import 'package:navika/models/personal-pronoun.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

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

  static List<PANCombo> getPANCombos(
      {required Cases caseType,
      required WordBank bank,
      required StaticSentenceParts Function(Noun, bool, Adjective, Adjective)
          getStaticSentenceParts,
      required StaticSentenceParts Function(PersonalPronoun, bool)
          getPersonalPronounSentenceStaticParts}) {
    var listItems = List<PANCombo>.empty(growable: true);

    bank.personalPronouns.forEach((persPronoun) {
      final isPlural = persPronoun.isPlural;
      final staticParts =
          getPersonalPronounSentenceStaticParts(persPronoun, isPlural);

      listItems.add(PANCombo(
        caseType: caseType,
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
          final includePossPronoun =
              possPronoun.isCompatible(noun.tags) && N.coinFlip();
          final includeAdjective = adj.isCompatible(noun.tags) && N.coinFlip();
          final isPlural = noun.nominativ.plural.first != '' && N.coinFlip();
          final staticParts =
              getStaticSentenceParts(noun, isPlural, possPronoun, adj);

          listItems.add(PANCombo(
              caseType: caseType,
              sentenceStarter: staticParts.start,
              sentenceEnder: staticParts.end,
              possPronoun: includePossPronoun ? possPronoun : null,
              adjective: includeAdjective ? adj : null,
              gender: noun.gender,
              isPlural: isPlural,
              noun: noun));
        });
      });
    });

    return listItems;
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
      // } else if (isBold && color != Colors.transparent) {
      //   textStyle = TextStyle(
      //     color: color,
      //     fontWeight: FontWeight.bold,
      //   );
      // } else if (isBold) {
      //   textStyle = TextStyle(
      //     fontWeight: FontWeight.bold,
      //   );
      // }
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
}
