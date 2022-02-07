import 'package:flutter/material.dart';
import 'package:navika/constants.dart';
import 'package:navika/models/enums.dart';
import 'package:navika/state/cases/case-question-state.dart';
import 'package:navika/utilities/navika-helpers.dart';
import 'package:navika/widgets/shared/free-form-entry.dart';
import 'package:navika/widgets/exercises/declension/shared/case-exercise-row-card.dart';

class CaseQuestionContent extends StatelessWidget {
  final CaseQuestionState stateItem;

  CaseQuestionContent({
    required this.stateItem,
  });

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

  @override
  Widget build(BuildContext context) {
    final bool usePossPronouns = stateItem.combos.possPronoun != null;
    final bool useAdj = stateItem.combos.adjective != null &&
        stateItem.combos.adjective!.dictionary != '';
    final bool useNoun = stateItem.combos.noun != null;
    final bool usePersPron = stateItem.combos.personalPronoun != null;

    var textFildWidth = N.getScreenWidth(reduction: 10);
    final List<Widget> sentenceContent = [
      if (stateItem.combos.sentenceStarter != '')
        Container(
          width: textFildWidth,
          child: Text(
            stateItem.combos.sentenceStarter,
            style: TextStyle(fontSize: EXERCISE_FONT_STYLE),
          ),
        ),
      if (usePossPronouns)
        FreeFormEntry(
          hintValue: stateItem.combos.possPronoun!.dictionary,
          initialValue: stateItem.userPossPronResponse,
          correctValues: stateItem.combos.correctPossPronouns,
          onChanged: (String newVal) {
            handleOnChange(GrammarTypes.PossesivePronoun, newVal);
          },
        ),
      if (useAdj)
        FreeFormEntry(
          hintValue: stateItem.combos.adjective!.dictionary,
          initialValue: stateItem.userAdjResponse,
          correctValues: stateItem.combos.correctAdjs,
          onChanged: (String newVal) {
            handleOnChange(GrammarTypes.Adjective, newVal);
          },
        ),
      if (useNoun)
        FreeFormEntry(
          hintValue: stateItem.combos.noun!.dictionary,
          initialValue: stateItem.userNounResponse,
          correctValues: stateItem.combos.correctNouns,
          onChanged: (String newVal) {
            handleOnChange(GrammarTypes.Noun, newVal);
          },
        ),
      if (usePersPron)
        FreeFormEntry(
          hintValue: stateItem.combos.personalPronoun!.dictionary,
          initialValue: stateItem.userPersPronResponse,
          correctValues: stateItem.combos.correctPersPronouns,
          onChanged: (String newVal) {
            handleOnChange(GrammarTypes.PersonalPronoun, newVal);
          },
        ),
      if (stateItem.combos.sentenceEnder != '')
        Container(
          width: textFildWidth,
          child: Text(
            stateItem.combos.sentenceEnder,
            style: TextStyle(fontSize: EXERCISE_FONT_STYLE),
          ),
        ),
    ];

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
      children: sentenceContent,
      gender: stateItem.combos.gender,
    );
  }
}
