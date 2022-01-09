import 'package:flutter/material.dart';
import 'package:navika/constants.dart';
import 'package:navika/models/enums.dart';
import 'package:navika/state/cases/case-question-state-item.dart';
import 'package:navika/utilities/navika-helpers.dart';
import 'package:navika/widgets/exercises/declension/shared/case-drop-down.dart';
import 'package:navika/widgets/shared/question-free-form.dart';
import 'package:navika/widgets/exercises/declension/shared/case-exercise-row-card.dart';

class CaseQuestionContent extends StatelessWidget {
  final Function(GrammarTypes, String) onChanged;
  final CaseQuestionStateItem stateItem;
  final EntryTypes entryType;

  CaseQuestionContent({
    required this.onChanged,
    required this.stateItem,
    required this.entryType,
  });

  @override
  Widget build(BuildContext context) {
    bool isAllCorrect = stateItem.isCorrect;
    final bool usePossPronouns = stateItem.combos.possPronoun != null;
    final bool useAdj = stateItem.combos.adjective != null &&
        stateItem.combos.adjective!.dictionary != '';
    final bool useNoun = stateItem.combos.noun != null;
    final bool usePersPron = stateItem.combos.personalPronoun != null;

    dropDowns() {
      return [
        if (usePossPronouns)
          CaseDropDown(
            activeValue: stateItem.userPossPronResponse == ''
                ? stateItem.combos.initialPossPronDropDownValue
                : stateItem.userPossPronResponse,
            correctValues: stateItem.combos.correctPossPronouns,
            dropDownOptions:
                N.getDropdownItems(adjective: stateItem.combos.possPronoun),
            onChanged: (String newVal) {
              onChanged(GrammarTypes.PossesivePronoun, newVal);
            },
          ),
        if (useAdj)
          CaseDropDown(
            activeValue: stateItem.userAdjResponse == ''
                ? stateItem.combos.initialAdjDropDownValue
                : stateItem.userAdjResponse,
            correctValues: stateItem.combos.correctAdjs,
            dropDownOptions:
                N.getDropdownItems(adjective: stateItem.combos.adjective!),
            onChanged: (String newVal) {
              onChanged(GrammarTypes.Adjective, newVal);
            },
          ),
        if (useNoun)
          CaseDropDown(
            activeValue: stateItem.userNounResponse == ''
                ? stateItem.combos.initialNounDropDownValue
                : stateItem.userNounResponse,
            correctValues: stateItem.combos.correctNouns,
            dropDownOptions: N.getDropdownItems(noun: stateItem.combos.noun!),
            onChanged: (String newVal) {
              onChanged(GrammarTypes.Noun, newVal);
            },
          ),
        if (usePersPron)
          CaseDropDown(
            activeValue: stateItem.userPersPronResponse == ''
                ? stateItem.combos.initialPersPronDropDownValue
                : stateItem.userPersPronResponse,
            correctValues: stateItem.combos.correctPersPronouns,
            dropDownOptions: N.getDropdownItems(
                personalPronoun: stateItem.combos.personalPronoun!),
            onChanged: (String newVal) {
              onChanged(GrammarTypes.PersonalPronoun, newVal);
            },
          ),
      ];
    }

    freeForms() {
      return [
        if (usePossPronouns)
          QuestionFreeForm(
            hintValue: stateItem.combos.possPronoun!.dictionary,
            activeValue: stateItem.userPossPronResponse,
            correctValues: stateItem.combos.correctPossPronouns,
            onChanged: (String newVal) {
              onChanged(GrammarTypes.PossesivePronoun, newVal);
            },
          ),
        if (useAdj)
          QuestionFreeForm(
            hintValue: stateItem.combos.adjective!.dictionary,
            activeValue: stateItem.userAdjResponse,
            correctValues: stateItem.combos.correctAdjs,
            onChanged: (String newVal) {
              onChanged(GrammarTypes.Adjective, newVal);
            },
          ),
        if (useNoun)
          QuestionFreeForm(
            hintValue: stateItem.combos.noun!.dictionary,
            activeValue: stateItem.userNounResponse,
            correctValues: stateItem.combos.correctNouns,
            onChanged: (String newVal) {
              onChanged(GrammarTypes.Noun, newVal);
            },
          ),
        if (usePersPron)
          QuestionFreeForm(
            hintValue: stateItem.combos.personalPronoun!.dictionary,
            activeValue: stateItem.userPersPronResponse,
            correctValues: stateItem.combos.correctPersPronouns,
            onChanged: (String newVal) {
              onChanged(GrammarTypes.PersonalPronoun, newVal);
            },
          ),
      ];
    }

    // This is a deterministic function that still
    // tries to create variety in the exercises
    bool getIsFreeForm(int total, int i) {
      final baseWord = stateItem.combos.personalPronoun != null
          ? stateItem.combos.personalPronoun!.dictionary
          : stateItem.combos.noun!.dictionary;

      if (total == 1 && stateItem.combos.personalPronoun != null) {
        return stateItem.combos.personalPronoun!.dictionary.contains('i');
      } else if (total == 1) {
        return stateItem.combos.noun!.dictionary.indexOf('e') > i;
      } else if (total == 2) {
        return stateItem.combos.noun!.dictionary.contains('n') ||
            (total * baseWord.length + 1) % (i + 1) == 0;
      } else if (stateItem.combos.noun!.dictionary.contains('j')) {
        return (total + baseWord.length) % (i + 1) == 0;
      }

      var t = baseWord.length % (i + total) == 0;
      return stateItem.combos.noun!.dictionary.contains('e') || t;
    }

    getMixedForms() {
      var freeF = freeForms();
      var dropD = dropDowns();
      var result = List<Widget>.empty(growable: true);

      for (int i = 0; i < freeF.length; i++) {
        final isFreeForm = getIsFreeForm(freeF.length, i);
        result.add(isFreeForm ? freeF[i] : dropD[i]);
      }

      return result;
    }

    List<Widget> sentenceContent = [
      if (stateItem.combos.sentenceStarter != '')
        Text(
          stateItem.combos.sentenceStarter,
          style: TextStyle(fontSize: EXERCISE_FONT_STYLE),
        ),
      if (entryType == EntryTypes.Select) ...dropDowns(),
      if (entryType == EntryTypes.FreeForm) ...freeForms(),
      if (entryType == EntryTypes.Mixed) ...getMixedForms(),
      if (stateItem.combos.sentenceEnder != '')
        Text(
          stateItem.combos.sentenceEnder,
          style: TextStyle(fontSize: EXERCISE_FONT_STYLE),
        ),
    ];

    return CaseExerciseRowCard(
      combos: stateItem.combos,
      isAllCorrect: isAllCorrect,
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
