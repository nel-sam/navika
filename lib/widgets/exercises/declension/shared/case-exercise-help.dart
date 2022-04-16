import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:navika/constants.dart';
import 'package:navika/models/adjective.dart';
import 'package:navika/models/enums.dart';
import 'package:navika/models/models.dart';
import 'package:navika/models/noun.dart';
import 'package:navika/models/personal-pronoun.dart';
import 'package:navika/utilities/navika-helpers.dart';
import 'package:navika/widgets/grammar/grammar-guide/child-widgets/declension-table-cell.dart';
import 'package:navika/widgets/grammar/grammar-guide/child-widgets/declension-table.dart';
import 'package:navika/widgets/grammar/grammar-guide/child-widgets/explanation-icon-cell.dart';
import 'package:navika/widgets/shared/translation-link.dart';
import 'package:nrs_flutter_lib/nrs_flutter_lib.dart';
import 'package:nrs_flutter_lib/widgets/n_sub_header.dart';
import 'package:nrs_flutter_lib/widgets/n_text_multi.dart';
import 'package:nrs_flutter_lib/widgets/n_text_span.dart';

class CaseExerciseHelp extends StatelessWidget {
  final PANCombo combos;
  final String joinChar = '/';

  const CaseExerciseHelp({
    Key? key,
    required this.combos,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenWidth = Nrs.getScreenWidth();

    return Scaffold(
      appBar:
          N.navAppBar(title: N.getCaseLabel(combos.caseType), context: context),
      body: Center(
        child: Container(
          width: screenWidth > 840 ? screenWidth / 2 : screenWidth,
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                children: [
                  getCorrectSentence(context, combos),
                  if (combos.possPronoun != null)
                    getAdjDeclensionTable(
                      context,
                      combos.possPronoun!,
                      combos.caseType,
                      combos.noun!.isAnimate,
                    ),
                  if (combos.adjective != null)
                    getAdjDeclensionTable(
                      context,
                      combos.adjective!,
                      combos.caseType,
                      combos.noun!.isAnimate,
                    ),
                  if (combos.noun != null)
                    getNounList(
                      context,
                      combos.noun!,
                      combos.caseType,
                      combos.isPlural,
                    ),
                  if (combos.personalPronoun != null)
                    getPersonalPronounDeclensionList(
                      context,
                      combos.personalPronoun!,
                      combos.caseType,
                    ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  getAdjDeclensionTable(
      BuildContext context, Adjective adj, Cases caseType, bool isAnimate) {
    final declensions = adj.getDeclensionObject(caseType, isAnimate);

    return Padding(
      padding: const EdgeInsets.only(top: 28.0),
      child: Column(
        children: [
          NTextSpan('${adj.dictionary} - ${N.getCaseLabel(combos.caseType)}',
              textStyle: Nrs.getTextStyle(context: context, isBold: true)),
          DeclensionTable(
            masculineSingular: getTableCell(
              declensions.masculine.singular,
              combos.gender == Genders.Masculine && !combos.isPlural,
            ),
            feminineSingular: getTableCell(
              declensions.feminine!.singular,
              combos.gender == Genders.Feminine && !combos.isPlural,
            ),
            neuterSingular: getTableCell(
              declensions.neuter!.singular,
              combos.gender == Genders.Neuter && !combos.isPlural,
            ),
            masculinePlural: getTableCell(
              declensions.masculine.plural,
              combos.gender == Genders.Masculine && combos.isPlural,
            ),
            femininePlural: getTableCell(
              declensions.feminine!.plural,
              combos.gender == Genders.Feminine && combos.isPlural,
            ),
            neuterPlural: getTableCell(
              declensions.neuter!.plural,
              combos.gender == Genders.Neuter && combos.isPlural,
            ),
          ),
        ],
      ),
    );
  }

  getCorrectSentence(BuildContext context, PANCombo combo) {
    String sentence = getSentenceAsString(combo);

    return Column(
      children: [
        NSubHeader(AppLocalizations.of(context)!.correctAnswer),
        NTextMulti([
          if (combo.sentenceStarter != '')
            TextSpan(text: '${combo.sentenceStarter} '),
          if (combo.possPronoun != null)
            TextSpan(
              text:
                  '${combo.possPronoun!.getDeclensions(combos.gender, combos.isPlural, combos.caseType, combos.noun!.isAnimate).join(joinChar)} ',
              style: Nrs.getTextStyle(context: context, isBold: true),
            ),
          if (combo.adjective != null)
            TextSpan(
              text:
                  '${combo.adjective!.getDeclensions(combos.gender, combos.isPlural, combos.caseType, combos.noun!.isAnimate).join(joinChar)} ',
              style: Nrs.getTextStyle(context: context, isBold: true),
            ),
          if (combo.noun != null)
            TextSpan(
              text:
                  '${combo.noun!.getDeclensions(combos.isPlural, combos.caseType).join(joinChar)}',
              style: Nrs.getTextStyle(context: context, isBold: true),
            ),
          if (combo.personalPronoun != null)
            TextSpan(
              text:
                  '${combo.personalPronoun!.getDeclensions(combos.caseType).join(joinChar)}',
              style: Nrs.getTextStyle(context: context, isBold: true),
            ),
          if (combo.sentenceEnder != '')
            TextSpan(text: ' ${combo.sentenceEnder}'),
        ]),
        TranslationLink(sentence: sentence),
      ],
    );
  }

  getDeclensionListItem(
      BuildContext context, String label, String value, bool isBold) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 120,
            decoration: BoxDecoration(
              border: Border(
                  right: BorderSide(
                width: 2,
                color: Colors.grey,
              )),
            ),
            child: Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: NTextSpan(label, textAlign: TextAlign.right),
            ),
          ),
          Container(
            width: 120,
            child: Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: NTextSpan(value,
                  textStyle: Nrs.getTextStyle(context: context, isBold: true)),
            ),
          )
        ],
      ),
    );
  }

  getNounList(BuildContext context, Noun noun, Cases caseType, bool isPlural) {
    final double topRowHeight = 65;

    return Container(
      child: Padding(
        padding: const EdgeInsets.only(top: 18.0),
        child: Column(
          children: [
            NTextSpan('${noun.dictionary} - ${N.getCaseLabel(combos.caseType)}',
                textStyle: Nrs.getTextStyle(context: context, isBold: true)),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(),
                Column(
                  // Column 1
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Container(
                      height: topRowHeight,
                    ),
                    Container(child: NTextSpan(N.getCaseLabel(Cases.Nom))),
                    Container(child: NTextSpan(N.getCaseLabel(Cases.Aku))),
                    Container(child: NTextSpan(N.getCaseLabel(Cases.Ins))),
                    Container(child: NTextSpan(N.getCaseLabel(Cases.Lok))),
                    Container(child: NTextSpan(N.getCaseLabel(Cases.Dat))),
                    Container(child: NTextSpan(N.getCaseLabel(Cases.Gen))),
                  ],
                ),
                Column(
                  // Column 2
                  children: [
                    Container(
                      height: topRowHeight,
                      child: ExplanationIconCell(
                        icon: Icon(SINGULAR_ICON, color: Colors.grey),
                        label: AppLocalizations.of(context)!.singular,
                      ),
                    ),
                    Container(
                        child: NTextSpan(noun.nominativ.singular.join(joinChar),
                            textStyle: Nrs.getTextStyle(
                                context: context,
                                isBold: caseType == Cases.Nom && !isPlural))),
                    Container(
                        child: NTextSpan(noun.akuzativ.singular.join(joinChar),
                            textStyle: Nrs.getTextStyle(
                                context: context,
                                isBold: caseType == Cases.Aku && !isPlural))),
                    Container(
                        child: NTextSpan(
                            noun.instrumental.singular.join(joinChar),
                            textStyle: Nrs.getTextStyle(
                                context: context,
                                isBold: caseType == Cases.Ins && !isPlural))),
                    Container(
                        child: NTextSpan(noun.lokativ.singular.join(joinChar),
                            textStyle: Nrs.getTextStyle(
                                context: context,
                                isBold: caseType == Cases.Lok && !isPlural))),
                    Container(
                        child: NTextSpan(noun.dativ.singular.join(joinChar),
                            textStyle: Nrs.getTextStyle(
                                context: context,
                                isBold: caseType == Cases.Dat && !isPlural))),
                    Container(
                        child: NTextSpan(noun.genitiv.singular.join(joinChar),
                            textStyle: Nrs.getTextStyle(
                                context: context,
                                isBold: caseType == Cases.Gen && !isPlural))),
                  ],
                ),
                Column(
                  // Column 3
                  children: [
                    Container(
                      height: topRowHeight,
                      child: ExplanationIconCell(
                        icon: Icon(PLURAL_ICON, color: Colors.grey),
                        label: AppLocalizations.of(context)!.plural,
                      ),
                    ),
                    Container(
                        child: NTextSpan(noun.nominativ.plural.join(joinChar),
                            textStyle: Nrs.getTextStyle(
                                context: context,
                                isBold: caseType == Cases.Nom && isPlural))),
                    Container(
                        child: NTextSpan(noun.akuzativ.plural.join(joinChar),
                            textStyle: Nrs.getTextStyle(
                                context: context,
                                isBold: caseType == Cases.Aku && isPlural))),
                    Container(
                        child: NTextSpan(
                            noun.instrumental.plural.join(joinChar),
                            textStyle: Nrs.getTextStyle(
                                context: context,
                                isBold: caseType == Cases.Ins && isPlural))),
                    Container(
                        child: NTextSpan(noun.lokativ.plural.join(joinChar),
                            textStyle: Nrs.getTextStyle(
                                context: context,
                                isBold: caseType == Cases.Lok && isPlural))),
                    Container(
                        child: NTextSpan(noun.dativ.plural.join(joinChar),
                            textStyle: Nrs.getTextStyle(
                                context: context,
                                isBold: caseType == Cases.Dat && isPlural))),
                    Container(
                        child: NTextSpan(noun.genitiv.plural.join(joinChar),
                            textStyle: Nrs.getTextStyle(
                                context: context,
                                isBold: caseType == Cases.Gen && isPlural))),
                  ],
                ),
                Column(),
              ],
            ),
          ],
        ),
      ),
    );
  }

  getPersonalPronounDeclensionList(
      BuildContext context, PersonalPronoun pp, Cases caseType) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        NSubHeader(pp.dictionary),
        getDeclensionListItem(context, N.getCaseLabel(Cases.Nom),
            pp.nominativ.forms.join(joinChar), caseType == Cases.Nom),
        getDeclensionListItem(context, N.getCaseLabel(Cases.Aku),
            pp.akuzativ.forms.join(joinChar), caseType == Cases.Aku),
        getDeclensionListItem(context, N.getCaseLabel(Cases.Ins),
            pp.instrumental.forms.join(joinChar), caseType == Cases.Ins),
        getDeclensionListItem(context, N.getCaseLabel(Cases.Lok),
            pp.lokativ.forms.join(joinChar), caseType == Cases.Lok),
        getDeclensionListItem(context, N.getCaseLabel(Cases.Dat),
            pp.dativ.forms.join(joinChar), caseType == Cases.Dat),
        getDeclensionListItem(context, N.getCaseLabel(Cases.Gen),
            pp.genitiv.forms.join(joinChar), caseType == Cases.Gen),
        getDeclensionListItem(context, N.getCaseLabel(Cases.Vok),
            pp.vokativ.forms.join(joinChar), caseType == Cases.Vok),
      ],
    );
  }

  String getSentenceAsString(PANCombo combo) {
    String sentence = '${combo.sentenceStarter} ';

    if (combo.possPronoun != null)
      sentence += '${combo.correctPossPronouns[0]} ';
    if (combo.adjective != null) sentence += '${combo.correctAdjectives[0]} ';
    if (combo.noun != null) sentence += '${combo.correctNouns[0]} ';
    if (combo.personalPronoun != null)
      sentence += '${combo.correctPersonalPronouns[0]} ';
    sentence += combo.sentenceEnder;
    return sentence;
  }

  DeclensionTableCell getTableCell(
      List<String> declensions, bool highlight) {
    return DeclensionTableCell(
      children: declensions.map((e) => TextSpan(text: '$e\n')).toList(),
      highlightItem: highlight,
    );
  }
}
