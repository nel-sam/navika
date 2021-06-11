import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:navika/constants.dart';
import 'package:navika/models/enums.dart';
import 'package:navika/utilities/widget-helpers.dart';
import 'package:navika/widgets/shared/explanation-icon-cell.dart';
import 'package:navika/widgets/shared/explanation-text-cell.dart';

class ExplanationPopupBase extends StatelessWidget {
  final String title;
  final String note;
  final ExplanationTextCell feminineSingular;
  final ExplanationTextCell masculineSingular;
  final ExplanationTextCell neuterSingular;
  final ExplanationTextCell femininePlural;
  final ExplanationTextCell masculinePlural;
  final ExplanationTextCell neuterPlural;
  final ExplanationTextCell pronounFeminineSingular;
  final ExplanationTextCell pronounMasculineSingular;
  final ExplanationTextCell pronounNeuterSingular;
  final ExplanationTextCell pronounFemininePlural;
  final ExplanationTextCell pronounMasculinePlural;
  final ExplanationTextCell pronounNeuterPlural;

  ExplanationPopupBase({
    required this.title,
    this.note = '',
    required this.feminineSingular,
    required this.masculineSingular,
    required this.neuterSingular,
    required this.femininePlural,
    required this.masculinePlural,
    required this.neuterPlural,
    required this.pronounFeminineSingular,
    required this.pronounMasculineSingular,
    required this.pronounNeuterSingular,
    required this.pronounFemininePlural,
    required this.pronounMasculinePlural,
    required this.pronounNeuterPlural,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: APPBAR_ELEVATION,
        backgroundColor: WidgetHelpers.getAppBarColor(context),
        textTheme: WidgetHelpers.getAppBarTextTheme(context),
        iconTheme: WidgetHelpers.getAppBarIconTheme(context),
        title: Text(title),
      ),
      body: Column(
        children: [
          getTable(
            AppLocalizations.of(context)!.pronouns,
            pronounMasculineSingular,
            pronounFeminineSingular,
            pronounNeuterSingular,
            pronounMasculinePlural,
            pronounFemininePlural,
            pronounNeuterPlural,
            note,
            context,
          ),
          getTable(
            AppLocalizations.of(context)!.adjectives,
            masculineSingular,
            feminineSingular,
            neuterSingular,
            masculinePlural,
            femininePlural,
            neuterPlural,
            note,
            context,
          ),
        ],
      ),
    );
  }
}

getTable(
  String title,
  final ExplanationTextCell masculineSingular,
  final ExplanationTextCell feminineSingular,
  final ExplanationTextCell neuterSingular,
  final ExplanationTextCell masculinePlural,
  final ExplanationTextCell femininePlural,
  final ExplanationTextCell neuterPlural,
  String note,
  BuildContext context,
) {
  double firstColWidth = 15;

  return Column(
    children: [
      Container(height: CELL_TEXT_PADDING + 30),
      Container(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 15, 0, 0),
              child: Text(
                title,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            Row(
              children: [
                Container(width: firstColWidth),
                ExplanationIconCell(
                  icon: WidgetHelpers.getGenderIcon(GenderEnum.Masculine),
                ),
                ExplanationIconCell(
                  icon: WidgetHelpers.getGenderIcon(GenderEnum.Feminine),
                ),
                ExplanationIconCell(
                  icon: WidgetHelpers.getGenderIcon(GenderEnum.Neuter),
                ),
              ],
            ),
            Row(children: [
              ExplanationIconCell(icon: SINGULAR_ICON, width: firstColWidth),
              masculineSingular,
              feminineSingular,
              neuterSingular,
            ]),
            Row(children: [
              ExplanationIconCell(icon: PLURAL_ICON, width: firstColWidth),
              masculinePlural,
              femininePlural,
              neuterPlural,
            ]),
            note != ''
                ? Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: RichText(
                      text: TextSpan(
                        style: TextStyle(
                            fontSize: 18,
                            color: WidgetHelpers.isDarkTheme(context)
                                ? Colors.white
                                : Colors.black),
                        children: [
                          TextSpan(text: '*'),
                          TextSpan(text: note, style: DECLINED_LETTER_STYLE)
                        ],
                      ),
                    ),
                  )
                : Container(),
          ],
        ),
      ),
    ],
  );
}
