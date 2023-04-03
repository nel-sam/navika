import 'package:flutter/material.dart';
import 'package:navika/models/adjective.dart';
import 'package:navika/models/enums.dart';
import 'package:navika/models/models.dart';
import 'package:navika/models/noun.dart';
import 'package:navika/models/personal-pronoun.dart';
import 'package:navika/state/settings/settings-consumer-wrapper.dart';
import 'package:navika/utilities/navika-helpers.dart';
import 'package:navika/widgets/grammar-guides/declension-guide/child-widgets/declension-table-cell.dart';
import 'package:navika/widgets/grammar-guides/declension-guide/child-widgets/declension-table.dart';
import 'package:navika/widgets/grammar-guides/declension-guide/declension-guide.dart';
import 'package:navika/widgets/shared/count_table_cells.dart';
import 'package:nrs_flutter_lib/constants.dart';
import 'package:nrs_flutter_lib/enums.dart';
import 'package:nrs_flutter_lib/nrs_flutter_lib.dart';
import 'package:nrs_flutter_lib/widgets/n_round_button.dart';
import 'package:nrs_flutter_lib/widgets/n_sub_header.dart';
import 'package:nrs_flutter_lib/widgets/n_text_span.dart';

class CaseExerciseHelp extends StatelessWidget {
  final PANCombo combos;
  final String joinChar = '/';
  final DialectType dialect;

  const CaseExerciseHelp({
    Key? key,
    required this.combos,
    required this.dialect,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenWidth = Nrs.getScreenWidth();

    return Scaffold(
      appBar:
          N.navAppBar(title: N.getCaseLabel(combos.caseType), context: context),
      body: SettingsConsumerWrapper(
        getChildWidget: (settings) => Center(
          child: Container(
            width: screenWidth > 840 ? screenWidth / 2 : screenWidth,
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  children: [
                    getCorrectSentenceWidget(context, combos),
                    NRoundButton(
                        title: N.t('go_to_declension_grammar_guide'),
                        onPressed: () {
                          final dest = DeclensionGuide(
                              startingCase: Cases.Nom,
                              dialect: settings.dialectType);
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => dest),
                          );
                        }),
                    ...combos.sentenceParts.map(
                      (CaseSentencePart e) {
                        final caseType = combos.caseType == Cases.Unspecified
                            ? e.caseType
                            : combos.caseType;

                        if (!e.isCorrectable) return Container();

                        if (e.grammarType == GrammarTypes.adjective ||
                            e.grammarType == GrammarTypes.possessivePronoun ||
                            e.grammarType ==
                                GrammarTypes.demonstrativePronoun) {
                          return getAdjDeclensionTable(
                            context,
                            e.actualObject,
                            caseType,
                            combos.isAnimate,
                          );
                        }

                        var isPlural = combos.isPlural;

                        if (e.forcedPlurality != Plurality.Inherited) {
                          isPlural = e.forcedPlurality == Plurality.Plural;
                        }

                        if (e.grammarType == GrammarTypes.noun) {
                          return getNounList(
                            context,
                            e.actualObject,
                            caseType,
                            isPlural,
                          );
                        }

                        if (e.grammarType == GrammarTypes.personalPronoun) {
                          return getPersonalPronounDeclensionList(
                            context,
                            e.actualObject,
                            caseType,
                          );
                        }

                        return Container();
                      },
                    ),
                  ],
                ),
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
          NSubHeader('${adj.dictionary} - ${N.getCaseLabel(caseType)}'),
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

  getCorrectSentenceWidget(BuildContext context, PANCombo combo) {
    return Padding(
      padding: const EdgeInsets.only(bottom: FONT_SIZE),
      child: Column(
        children: [
          NSubHeader(N.t('correctAnswer')),
          Padding(
            padding: const EdgeInsets.only(bottom: FONT_SIZE),
            child: Wrap(
                direction: Axis.horizontal,
                alignment: WrapAlignment.start,
                children: N.getCorrectSentence(context, combo.sentenceParts)),
          ),
          NTextSpan(combo.translation)
        ],
      ),
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
                  textStyle: Nrs.getTextStyle(
                    context: context,
                    isBold: isBold,
                  )),
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
        padding: const EdgeInsets.only(
            top: FONT_SIZE * 3, left: FONT_SIZE, right: FONT_SIZE),
        child: Column(
          children: [
            NSubHeader('${noun.dictionary} - ${N.getCaseLabel(caseType)}'),
            Table(
              defaultVerticalAlignment: TableCellVerticalAlignment.middle,
              children: [
                TableRow(children: [
                  // Headers
                  TableCellWrapper(
                    isHeader: true,
                    child: Container(),
                  ),
                  SingularTableCell(),
                  PluralTableCell(),
                ]),
                TableRow(children: [
                  TableCell(
                      child: NTextSpan(
                    N.getCaseLabel(Cases.Nom),
                    textAlign: TextAlign.end,
                  )),
                  TableCell(
                      child: NTextSpan(noun.nominativ.singular.join(joinChar),
                          textAlign: TextAlign.center,
                          textStyle: Nrs.getTextStyle(
                              context: context,
                              isBold: caseType == Cases.Nom && !isPlural))),
                  TableCell(
                      child: NTextSpan(noun.nominativ.plural.join(joinChar),
                          textAlign: TextAlign.center,
                          textStyle: Nrs.getTextStyle(
                              context: context,
                              isBold: caseType == Cases.Nom && isPlural))),
                ]),
                TableRow(children: [
                  TableCell(
                      child: NTextSpan(
                    N.getCaseLabel(Cases.Gen),
                    textAlign: TextAlign.end,
                  )),
                  TableCell(
                      child: NTextSpan(noun.genitiv.singular.join(joinChar),
                          textAlign: TextAlign.center,
                          textStyle: Nrs.getTextStyle(
                              context: context,
                              isBold: caseType == Cases.Gen && !isPlural))),
                  TableCell(
                      child: NTextSpan(noun.genitiv.plural.join(joinChar),
                          textAlign: TextAlign.center,
                          textStyle: Nrs.getTextStyle(
                              context: context,
                              isBold: caseType == Cases.Gen && isPlural))),
                ]),
                TableRow(children: [
                  TableCell(
                      child: NTextSpan(
                    N.getCaseLabel(Cases.Dat),
                    textAlign: TextAlign.end,
                  )),
                  TableCell(
                      child: NTextSpan(noun.dativ!.singular.join(joinChar),
                          textAlign: TextAlign.center,
                          textStyle: Nrs.getTextStyle(
                              context: context,
                              isBold: caseType == Cases.Dat && !isPlural))),
                  TableCell(
                      child: NTextSpan(noun.dativ!.plural.join(joinChar),
                          textAlign: TextAlign.center,
                          textStyle: Nrs.getTextStyle(
                              context: context,
                              isBold: caseType == Cases.Dat && isPlural))),
                ]),
                TableRow(children: [
                  TableCell(
                      child: NTextSpan(
                    N.getCaseLabel(Cases.Aku),
                    textAlign: TextAlign.end,
                  )),
                  TableCell(
                      child: NTextSpan(noun.akuzativ.singular.join(joinChar),
                          textAlign: TextAlign.center,
                          textStyle: Nrs.getTextStyle(
                              context: context,
                              isBold: caseType == Cases.Aku && !isPlural))),
                  TableCell(
                      child: NTextSpan(noun.akuzativ.plural.join(joinChar),
                          textAlign: TextAlign.center,
                          textStyle: Nrs.getTextStyle(
                              context: context,
                              isBold: caseType == Cases.Aku && isPlural))),
                ]),
                TableRow(children: [
                  TableCell(
                      child: NTextSpan(
                    N.getCaseLabel(Cases.Vok),
                    textAlign: TextAlign.end,
                  )),
                  TableCell(
                      child: NTextSpan(noun.vokativ.singular.join(joinChar),
                          textAlign: TextAlign.center,
                          textStyle: Nrs.getTextStyle(
                              context: context,
                              isBold: caseType == Cases.Vok && !isPlural))),
                  TableCell(
                      child: NTextSpan(noun.vokativ.plural.join(joinChar),
                          textAlign: TextAlign.center,
                          textStyle: Nrs.getTextStyle(
                              context: context,
                              isBold: caseType == Cases.Vok && isPlural))),
                ]),
                TableRow(children: [
                  TableCell(
                      child: NTextSpan(
                    N.getCaseLabel(Cases.Ins),
                    textAlign: TextAlign.end,
                  )),
                  TableCell(
                      child: NTextSpan(
                          noun.instrumental.singular.join(joinChar),
                          textAlign: TextAlign.center,
                          textStyle: Nrs.getTextStyle(
                              context: context,
                              isBold: caseType == Cases.Ins && !isPlural))),
                  TableCell(
                      child: NTextSpan(noun.instrumental.plural.join(joinChar),
                          textAlign: TextAlign.center,
                          textStyle: Nrs.getTextStyle(
                              context: context,
                              isBold: caseType == Cases.Ins && isPlural))),
                ]),
                TableRow(children: [
                  TableCell(
                      child: NTextSpan(
                    N.getCaseLabel(Cases.Lok),
                    textAlign: TextAlign.end,
                  )),
                  TableCell(
                      child: NTextSpan(noun.lokativ.singular.join(joinChar),
                          textAlign: TextAlign.center,
                          textStyle: Nrs.getTextStyle(
                              context: context,
                              isBold: caseType == Cases.Lok && !isPlural))),
                  TableCell(
                      child: NTextSpan(noun.lokativ.plural.join(joinChar),
                          textAlign: TextAlign.center,
                          textStyle: Nrs.getTextStyle(
                              context: context,
                              isBold: caseType == Cases.Lok && isPlural))),
                ]),
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
        NSubHeader('${pp.dictionary} - ${N.getCaseLabel(caseType)}'),
        getDeclensionListItem(
          context,
          N.getCaseLabel(Cases.Nom),
          pp.nominativ.forms.join(joinChar),
          caseType == Cases.Nom,
        ),
        getDeclensionListItem(
          context,
          N.getCaseLabel(Cases.Aku),
          pp.akuzativ.forms.join(joinChar),
          caseType == Cases.Aku,
        ),
        getDeclensionListItem(
          context,
          N.getCaseLabel(Cases.Ins),
          pp.instrumental.forms.join(joinChar),
          caseType == Cases.Ins,
        ),
        getDeclensionListItem(
          context,
          N.getCaseLabel(Cases.Lok),
          pp.lokativ.forms.join(joinChar),
          caseType == Cases.Lok,
        ),
        getDeclensionListItem(
          context,
          N.getCaseLabel(Cases.Dat),
          pp.dativ.forms.join(joinChar),
          caseType == Cases.Dat,
        ),
        getDeclensionListItem(
          context,
          N.getCaseLabel(Cases.Gen),
          pp.genitiv.forms.join(joinChar),
          caseType == Cases.Gen,
        ),
        getDeclensionListItem(
          context,
          N.getCaseLabel(Cases.Vok),
          pp.vokativ.forms.join(joinChar),
          caseType == Cases.Vok,
        ),
      ],
    );
  }

  // String getSentenceAsString(PANCombo combo) {
  //   String sentence = '${combo.sentenceStarter} ';

  //   if (combo.possPronoun != null)
  //     sentence += '${combo.correctPossPronouns[0]} ';
  //   if (combo.adjective != null) sentence += '${combo.correctAdjectives[0]} ';
  //   if (combo.noun != null) sentence += '${combo.correctNouns[0]} ';
  //   if (combo.personalPronoun != null)
  //     sentence += '${combo.correctPersonalPronouns[0]} ';
  //   sentence += combo.sentenceEnder;
  //   return sentence;
  // }

  DeclensionTableCell getTableCell(List<String> declensions, bool highlight) {
    return DeclensionTableCell(
      children: declensions.map((e) => TextSpan(text: '$e\n')).toList(),
      highlightItem: highlight,
    );
  }
}
