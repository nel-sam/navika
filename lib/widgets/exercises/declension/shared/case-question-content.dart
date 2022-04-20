import 'package:flutter/material.dart';
import 'package:navika/constants.dart';
import 'package:navika/state/cases/case-question-state.dart';
import 'package:navika/widgets/exercises/declension/shared/case-exercise-row-card.dart';
import 'package:navika/widgets/shared/n-free-form-entry.dart';
import 'package:nrs_flutter_lib/enums.dart';
import 'package:nrs_flutter_lib/widgets/n_sub_header.dart';

class CaseQuestionContent extends StatelessWidget {
  final CaseQuestionState stateItem;

  CaseQuestionContent({
    required this.stateItem,
  });

  @override
  Widget build(BuildContext context) {
    final trans = stateItem.combos.getTrans != null
        ? stateItem.combos.getTrans!(context)
        : '';

    // final bool usePossPronouns = stateItem.combos.possPronoun != null;
    // final bool useAdj = stateItem.combos.adjective != null &&
    //     stateItem.combos.adjective!.dictionary != '';
    // final bool useNoun = stateItem.combos.noun != null;
    // final bool usePersonalPronoun = stateItem.combos.personalPronoun != null;

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
        if (trans.length > 0) NSubHeader(trans),
        ...stateItem.combos.sentenceParts.map((e) {
          if (!e.isCorrectable) {
            return Text(
              e.displayValue,
              style: TextStyle(fontSize: EXERCISE_FONT_STYLE),
            );
          }

          //stateItem.updateUserInput(e.grammarType.name, false);
          return NFreeFormEntry(
            hintValue: e.displayValue,
            initialValue: stateItem.userPossPronResponse,
            correctValues: e.correctValues,
            onChanged: (String newVal) {
              handleOnChange(e.grammarType, newVal, e.correctValues);
            },
          );
        }).toList()
      ],
      // children: [
      //   // TODO: Make this a list of sentence part types in any order
      //   if (stateItem.combos.sentenceStarter != '')
      //     Text(
      //       stateItem.combos.sentenceStarter,
      //       style: TextStyle(fontSize: EXERCISE_FONT_STYLE),
      //     ),
      //   if (usePossPronouns)
      //     NFreeFormEntry(
      //       hintValue: stateItem.combos.possPronoun!.dictionary,
      //       initialValue: stateItem.userPossPronResponse,
      //       correctValues: stateItem.combos.correctPossPronouns,
      //       onChanged: (String newVal) {
      //         handleOnChange(GrammarTypes.possessivePronoun, newVal);
      //       },
      //     ),
      //   if (useAdj)
      //     NFreeFormEntry(
      //       hintValue: stateItem.combos.adjective!.dictionary,
      //       initialValue: stateItem.userAdjResponse,
      //       correctValues: stateItem.combos.correctAdjectives,
      //       onChanged: (String newVal) {
      //         handleOnChange(GrammarTypes.adjective, newVal);
      //       },
      //     ),
      //   if (useNoun)
      //     NFreeFormEntry(
      //       hintValue: stateItem.combos.noun!.dictionary,
      //       initialValue: stateItem.userNounResponse,
      //       correctValues: stateItem.combos.correctNouns,
      //       onChanged: (String newVal) {
      //         handleOnChange(GrammarTypes.noun, newVal);
      //       },
      //     ),
      //   if (usePersonalPronoun)
      //     NFreeFormEntry(
      //       hintValue: stateItem.combos.personalPronoun!.dictionary,
      //       initialValue: stateItem.userPersonalPronounResponse,
      //       correctValues: stateItem.combos.correctPersonalPronouns,
      //       onChanged: (String newVal) {
      //         handleOnChange(GrammarTypes.personalPronoun, newVal);
      //       },
      //     ),
      //   if (stateItem.combos.sentenceEnder != '')
      //     Text(
      //       stateItem.combos.sentenceEnder,
      //       style: TextStyle(fontSize: EXERCISE_FONT_STYLE),
      //     ),
      // ],
      gender: stateItem.combos.gender,
    );
  }

  handleOnChange(
      GrammarTypes grammarType, String newValue, List<String> correctValues) {
    final isCorrect = correctValues.contains(newValue);
    stateItem.updateUserInput(grammarType.name, isCorrect);
    // TODO: Delete below
    // switch (grammarType) {
    //   case GrammarTypes.noun:
    //     stateItem.updateNoun(newValue);
    //     break;
    //   case GrammarTypes.personalPronoun:
    //     stateItem.updatePersonalPronoun(newValue);
    //     break;
    //   case GrammarTypes.possessivePronoun:
    //     stateItem.updatePossPronoun(newValue);
    //     break;
    //   case GrammarTypes.adjective:
    //     stateItem.updateAdj(newValue);
    //     break;
    // }
  }
}
