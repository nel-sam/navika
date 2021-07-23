import 'package:flutter/material.dart';
import 'package:navika/constants.dart';
import 'package:navika/models/adjective.dart';
import 'package:navika/models/enums.dart';
import 'package:navika/models/models.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:navika/models/noun.dart';
import 'package:navika/models/personal-pronoun.dart';
import 'package:navika/utilities/navika-helpers.dart';
import 'package:navika/widgets/grammar-guide/child-widgets/declension-table-cell.dart';
import 'package:navika/widgets/grammar-guide/child-widgets/declension-table.dart';
import 'package:navika/widgets/grammar-guide/child-widgets/explanation-icon-cell.dart';
import 'package:navika/widgets/grammar-guide/child-widgets/navika-subheader.dart';
import 'package:navika/widgets/shared/navika-text.dart';
import 'package:navika/widgets/shared/translation-link.dart';

class ExerciseHelp extends StatelessWidget {
  final PANCombo combos;
  final String joinChar = '/';

  const ExerciseHelp({
    Key? key,
    required this.combos,
  }) : super(key: key);

  getAdjDeclensionTable(Adjective adj, Cases caseType, bool isAnimate) {
    final declensions = adj.getDeclensionObject(caseType, isAnimate);

    return Padding(
      padding: const EdgeInsets.only(top: 28.0),
      child: Column(
        children: [
          NText([
            N.NTextSpan(adj.dictionary, isBold: true),
          ]),
          DeclensionTable(
            masculineSingular: getTableCell(
              declensions.masculine.singular,
              combos.gender == Genders.Masculine && !combos.isPlural,
            ),
            feminineSingular: getTableCell(
              declensions.feminine.singular,
              combos.gender == Genders.Feminine && !combos.isPlural,
            ),
            neuterSingular: getTableCell(
              declensions.neuter.singular,
              combos.gender == Genders.Neuter && !combos.isPlural,
            ),
            masculinePlural: getTableCell(
              declensions.masculine.plural,
              combos.gender == Genders.Masculine && combos.isPlural,
            ),
            femininePlural: getTableCell(
              declensions.feminine.plural,
              combos.gender == Genders.Feminine && combos.isPlural,
            ),
            neuterPlural: getTableCell(
              declensions.neuter.plural,
              combos.gender == Genders.Neuter && combos.isPlural,
            ),
          ),
        ],
      ),
    );
  }

  getNounList(BuildContext context, Noun noun, Cases caseType, bool isPlural) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.only(top: 18.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(),
                Column(
                  // Column 1
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Container(
                        height: 62, child: NSubHeader(text: noun.dictionary)),
                    Container(
                        child: NText([N.NTextSpan(N.getCaseLabel(Cases.Nom))])),
                    Container(
                        child: NText([N.NTextSpan(N.getCaseLabel(Cases.Aku))])),
                    Container(
                        child: NText([N.NTextSpan(N.getCaseLabel(Cases.Ins))])),
                    Container(
                        child: NText([N.NTextSpan(N.getCaseLabel(Cases.Lok))])),
                    Container(
                        child: NText([N.NTextSpan(N.getCaseLabel(Cases.Dat))])),
                    Container(
                        child: NText([N.NTextSpan(N.getCaseLabel(Cases.Gen))])),
                  ],
                ),
                Column(
                  // Column 2
                  children: [
                    ExplanationIconCell(
                      icon: SINGULAR_ICON,
                      label: AppLocalizations.of(context)!.singular,
                    ),
                    Container(
                        child: NText([
                      N.NTextSpan(noun.nominativ.singular.join(joinChar),
                          isBold: caseType == Cases.Nom && !isPlural)
                    ])),
                    Container(
                        child: NText([
                      N.NTextSpan(noun.akuzativ.singular.join(joinChar),
                          isBold: caseType == Cases.Aku && !isPlural)
                    ])),
                    Container(
                        child: NText([
                      N.NTextSpan(noun.instrumental.singular.join(joinChar),
                          isBold: caseType == Cases.Ins && !isPlural)
                    ])),
                    Container(
                        child: NText([
                      N.NTextSpan(noun.lokativ.singular.join(joinChar),
                          isBold: caseType == Cases.Lok && !isPlural)
                    ])),
                    Container(
                        child: NText([
                      N.NTextSpan(noun.dativ.singular.join(joinChar),
                          isBold: caseType == Cases.Dat && !isPlural)
                    ])),
                    Container(
                        child: NText([
                      N.NTextSpan(noun.genitiv.singular.join(joinChar),
                          isBold: caseType == Cases.Gen && !isPlural)
                    ])),
                  ],
                ),
                Column(
                  // Column 3
                  children: [
                    ExplanationIconCell(
                      icon: PLURAL_ICON,
                      label: AppLocalizations.of(context)!.plural,
                    ),
                    Container(
                        child: NText([
                      N.NTextSpan(noun.nominativ.plural.join(joinChar),
                          isBold: caseType == Cases.Nom && isPlural)
                    ])),
                    Container(
                        child: NText([
                      N.NTextSpan(noun.akuzativ.plural.join(joinChar),
                          isBold: caseType == Cases.Aku && isPlural)
                    ])),
                    Container(
                        child: NText([
                      N.NTextSpan(noun.instrumental.plural.join(joinChar),
                          isBold: caseType == Cases.Ins && isPlural)
                    ])),
                    Container(
                        child: NText([
                      N.NTextSpan(noun.lokativ.plural.join(joinChar),
                          isBold: caseType == Cases.Lok && isPlural)
                    ])),
                    Container(
                        child: NText([
                      N.NTextSpan(noun.dativ.plural.join(joinChar),
                          isBold: caseType == Cases.Dat && isPlural)
                    ])),
                    Container(
                        child: NText([
                      N.NTextSpan(noun.genitiv.plural.join(joinChar),
                          isBold: caseType == Cases.Gen && isPlural)
                    ])),
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

  getDeclensionListItem(String label, String value, bool isBold) {
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
              child: NText(
                [N.NTextSpan(label)],
                textAlign: TextAlign.right,
              ),
            ),
          ),
          Container(
            width: 120,
            child: Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: NText([N.NTextSpan(value, isBold: isBold)]),
            ),
          )
        ],
      ),
    );
  }

  getPersProneclensionList(
      BuildContext context, PersonalPronoun pp, Cases caseType) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        NSubHeader(text: pp.dictionary),
        getDeclensionListItem(N.getCaseLabel(Cases.Nom),
            pp.nominativ.forms.join(joinChar), caseType == Cases.Nom),
        getDeclensionListItem(N.getCaseLabel(Cases.Aku),
            pp.akuzativ.forms.join(joinChar), caseType == Cases.Aku),
        getDeclensionListItem(N.getCaseLabel(Cases.Ins),
            pp.instrumental.forms.join(joinChar), caseType == Cases.Ins),
        getDeclensionListItem(N.getCaseLabel(Cases.Lok),
            pp.lokativ.forms.join(joinChar), caseType == Cases.Lok),
        getDeclensionListItem(N.getCaseLabel(Cases.Dat),
            pp.dativ.forms.join(joinChar), caseType == Cases.Dat),
        getDeclensionListItem(N.getCaseLabel(Cases.Gen),
            pp.genitiv.forms.join(joinChar), caseType == Cases.Gen),
        getDeclensionListItem(N.getCaseLabel(Cases.Vok),
            pp.vokativ.forms.join(joinChar), caseType == Cases.Vok),
      ],
    );
  }

  DeclensionTableCell getTableCell(List<String> declensions, bool highlight) {
    return DeclensionTableCell(
      children: declensions.map((e) => N.NTextSpan('$e\n')).toList(),
      highlightItem: highlight,
    );
  }

  String getSentenceAsString(PANCombo combo) {
    String sentence = '${combo.sentenceStarter} ';

    if (combo.possPronoun != null)
      sentence += '${combo.correctPossPronouns[0]} ';
    if (combo.adjective != null) sentence += '${combo.correctAdjs[0]} ';
    if (combo.noun != null) sentence += '${combo.correctNouns[0]} ';
    if (combo.personalPronoun != null)
      sentence += '${combo.correctPersPronouns[0]} ';
    sentence += combo.sentenceEnder;
    return sentence;
  }

  getCorrectSentence(BuildContext context, PANCombo combo) {
    String sentence = getSentenceAsString(combo);

    return Column(
      children: [
        NSubHeader(text: AppLocalizations.of(context)!.correctAnswer),
        NText([
          if (combo.sentenceStarter != '')
            N.NTextSpan('${combo.sentenceStarter} '),
          if (combo.possPronoun != null)
            N.NTextSpan(
              '${combo.possPronoun!.getDeclensions(combos.gender, combos.isPlural, combos.caseType, combos.noun!.isAnimate).join(joinChar)} ',
              isBold: true,
            ),
          if (combo.adjective != null)
            N.NTextSpan(
              '${combo.adjective!.getDeclensions(combos.gender, combos.isPlural, combos.caseType, combos.noun!.isAnimate).join(joinChar)} ',
              isBold: true,
            ),
          if (combo.noun != null)
            N.NTextSpan(
              '${combo.noun!.getDeclensions(combos.isPlural, combos.caseType).join(joinChar)}',
              isBold: true,
            ),
          if (combo.personalPronoun != null)
            N.NTextSpan(
              '${combo.personalPronoun!.getDeclensions(combos.caseType).join(joinChar)}',
              isBold: true,
            ),
          if (combo.sentenceEnder != '') N.NTextSpan(' ${combo.sentenceEnder}'),
        ]),
        TranslationLink(sentence: sentence),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        leading: Builder(builder: (BuildContext context) => BackButton()),
        elevation: APPBAR_ELEVATION,
        backgroundColor: N.getAppBarColor(context),
        textTheme: N.getAppBarTextTheme(context),
        iconTheme: N.getAppBarIconTheme(context),
        title: Text(N.getCaseLabel(combos.caseType)),
      ),
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
                      combos.possPronoun!,
                      combos.caseType,
                      combos.noun!.isAnimate,
                    ),
                  if (combos.adjective != null)
                    getAdjDeclensionTable(
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
                    getPersProneclensionList(
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
}
