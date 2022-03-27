import 'package:flutter/material.dart';
import 'package:navika/constants.dart';
import 'package:navika/state/cases/case-question-state.dart';
import 'package:navika/widgets/exercises/declension/shared/case-exercise-row-card.dart';
import 'package:navika/widgets/shared/n-free-form-entry.dart';
import 'package:nrs_flutter_lib/enums.dart';
import 'package:nrs_flutter_lib/nrs_flutter_lib.dart';

class CaseQuestionContent extends StatelessWidget {
  final CaseQuestionState stateItem;

  CaseQuestionContent({
    required this.stateItem,
  });

  @override
  Widget build(BuildContext context) {
    final bool usePossPronouns = stateItem.combos.possPronoun != null;
    final bool useAdj = stateItem.combos.adjective != null &&
        stateItem.combos.adjective!.dictionary != '';
    final bool useNoun = stateItem.combos.noun != null;
    final bool usePersonalPronoun = stateItem.combos.personalPronoun != null;
    final textFieldWidth = Nrs.getScreenWidth(reduction: 10);

    // TODO: Incorporate this into widget
    //  if (multipleCorrect)
    //         Row(children: [
    //           status == CorrectStatus.correct
    //               ? NTextSpan(
    //                   '${AppLocalizations.of(context)!.alsoCorrect}: ${widget.correctValues.join(',')}',
    //                   textStyle: Nrs.getTextStyle(
    //                       context: context, fontSize: FONT_SIZE - 3))
    //               : NTextSpan(
    //                   '${AppLocalizations.of(context)!.multipleCorrect}',
    //                   textStyle: Nrs.getTextStyle(
    //                       context: context, fontSize: FONT_SIZE - 3))
    //         ]),

    return CaseExerciseRowCard(
      combos: stateItem.combos,
      isAllCorrect: stateItem.isCorrect,
      isPlural: stateItem.combos.isPlural,
      isAnimate: stateItem.combos.noun == null
          ? false
          : stateItem.combos.noun!.isAnimate,
      getExtraInfo: stateItem.combos.noun == null
          ? (BuildContext context) => ''
          : stateItem.combos.noun!.getExtraInfo,
      children: [
        if (stateItem.combos.sentenceStarter != '')
          Container(
            width: textFieldWidth,
            child: Text(
              stateItem.combos.sentenceStarter,
              style: TextStyle(fontSize: EXERCISE_FONT_STYLE),
            ),
          ),
        if (usePossPronouns)
          NFreeFormEntry(
            hintValue: stateItem.combos.possPronoun!.dictionary,
            initialValue: stateItem.userPossPronResponse,
            correctValues: stateItem.combos.correctPossPronouns,
            onChanged: (String newVal) {
              handleOnChange(GrammarTypes.PossesivePronoun, newVal);
            },
          ),
        if (useAdj)
          NFreeFormEntry(
            hintValue: stateItem.combos.adjective!.dictionary,
            initialValue: stateItem.userAdjResponse,
            correctValues: stateItem.combos.correctAdjectives,
            onChanged: (String newVal) {
              handleOnChange(GrammarTypes.Adjective, newVal);
            },
          ),
        if (useNoun)
          NFreeFormEntry(
            hintValue: stateItem.combos.noun!.dictionary,
            initialValue: stateItem.userNounResponse,
            correctValues: stateItem.combos.correctNouns,
            onChanged: (String newVal) {
              handleOnChange(GrammarTypes.Noun, newVal);
            },
          ),
        if (usePersonalPronoun)
          NFreeFormEntry(
            hintValue: stateItem.combos.personalPronoun!.dictionary,
            initialValue: stateItem.userPersPronResponse,
            correctValues: stateItem.combos.correctPersonalPronouns,
            onChanged: (String newVal) {
              handleOnChange(GrammarTypes.PersonalPronoun, newVal);
            },
          ),
        if (stateItem.combos.sentenceEnder != '')
          Container(
            width: textFieldWidth,
            child: Text(
              stateItem.combos.sentenceEnder,
              style: TextStyle(fontSize: EXERCISE_FONT_STYLE),
            ),
          ),
      ],
      gender: stateItem.combos.gender,
    );
  }

  handleOnChange(GrammarTypes grammarType, String newValue) {
    switch (grammarType) {
      case GrammarTypes.Noun:
        stateItem.updateNoun(newValue);
        break;
      case GrammarTypes.PersonalPronoun:
        stateItem.updatePersPronoun(newValue);
        break;
      case GrammarTypes.PossesivePronoun:
        stateItem.updatePossPronoun(newValue);
        break;
      case GrammarTypes.Adjective:
        stateItem.updateAdj(newValue);
        break;
    }
  }
}
