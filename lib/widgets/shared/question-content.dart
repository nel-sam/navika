import 'package:flutter/material.dart';
import 'package:navika/constants.dart';
import 'package:navika/models/enums.dart';
import 'package:navika/models/adjective.dart';
import 'package:navika/models/models.dart';
import 'package:navika/models/noun.dart';
import 'package:navika/models/personal-pronoun.dart';
import 'package:navika/utilities/navika-helpers.dart';
import 'package:navika/widgets/shared/case-drop-down.dart';
import 'package:navika/widgets/shared/case-free-form.dart';
import 'package:navika/widgets/shared/exercise-row-card.dart';

// ignore: must_be_immutable
class QuestionContent extends StatefulWidget {
  QuestionStateItem stateItem;
  EntryTypes entryType;

  QuestionContent({
    required this.stateItem,
    required this.entryType,
  });

  @override
  Widget build(BuildContext context) {
    bool isAllCorrect = stateItem.checkAnswer();
    final bool usePossPronouns = stateItem.combos.pronoun != null;
    final bool useAdj = stateItem.combos.adjective != null;
    final bool useNoun = stateItem.combos.noun != null;
    final bool usePersPron = stateItem.combos.personalPronoun != null;

    dropDowns() {
      return [
        if (usePossPronouns)
          CaseDropDown(
            activeValue: stateItem.userPronResponse,
            correctValues: stateItem.combos.correctPronouns,
            dropDownOptions:
                N.getDropdownItems(adjective: stateItem.combos.pronoun),
            onChanged: (String newVal) {
              stateItem.userPronResponse = newVal;
              isAllCorrect = stateItem.checkAnswer();
            },
          ),
        if (useAdj)
          CaseDropDown(
            activeValue: stateItem.userAdjResponse,
            correctValues: stateItem.combos.correctAdjs,
            dropDownOptions:
                N.getDropdownItems(adjective: stateItem.combos.adjective!),
            onChanged: (String newVal) {
              // TODO: Use store to set?
              stateItem.userAdjResponse = newVal;
              isAllCorrect = stateItem.checkAnswer();
            },
          ),
        if (useNoun)
          CaseDropDown(
            activeValue: stateItem.combos.activeNoun!,
            correctValues: stateItem.combos.correctNouns!,
            dropDownOptions: N.getDropdownItems(noun: stateItem.combos.noun!),
            onChanged: (String newVal) {
              setState(() {
                stateItem.combos.activeNoun = newVal;
                isAllCorrect = checkAnswer();
              });
            },
          ),
        if (usePersPron)
          CaseDropDown(
            activeValue: stateItem.combos.activePersPron!,
            correctValues: stateItem.combos.correctPersProns!,
            dropDownOptions: N.getDropdownItems(
                personalPronoun: stateItem.combos.personalPronoun!),
            onChanged: (String newVal) {
              setState(() {
                stateItem.combos.activePersPron = newVal;
                isAllCorrect = checkAnswer();
              });
            },
          ),
      ];
    }

    freeForms() {
      return [
        if (usePossPronouns)
          CaseFreeForm(
            hintValue: stateItem.combos.possPronoun!.dictionary,
            maxLength: stateItem.combos.possPronoun!
                .longestForCase(stateItem.combos.caseType),
            activeValue: stateItem.combos.userPronResponse!,
            correctValues: stateItem.combos.correctPossProns!,
            onChanged: (String newVal) {
              setState(() {
                stateItem.combos.userPronResponse = newVal;
                isAllCorrect = checkAnswer();
              });
            },
          ),
        if (useAdj)
          CaseFreeForm(
            hintValue: stateItem.combos.adjective!.dictionary,
            maxLength: stateItem.combos.adjective!
                .longestForCase(stateItem.combos.caseType),
            activeValue: stateItem.userAdjResponse,
            correctValues: stateItem.combos.correctAdjs!,
            onChanged: (String newVal) {
              setState(() {
                stateItem.combos.activeAdj = newVal;
                isAllCorrect = checkAnswer();
              });
            },
          ),
        if (useNoun)
          CaseFreeForm(
            hintValue: stateItem.combos.noun!.dictionary,
            maxLength: stateItem.combos.noun!
                .longestForCase(stateItem.combos.caseType),
            activeValue: stateItem.combos.activeNoun!,
            correctValues: stateItem.combos.correctNouns!,
            onChanged: (String newVal) {
              setState(() {
                stateItem.combos.activeNoun = newVal;
                isAllCorrect = checkAnswer();
              });
            },
          ),
        if (usePersPron)
          CaseFreeForm(
            hintValue: stateItem.combos.personalPronoun!.dictionary,
            maxLength: stateItem.combos.personalPronoun!
                .longestForCase(stateItem.combos.caseType),
            activeValue: stateItem.combos.activePersPron!,
            correctValues: stateItem.combos.correctPersProns!,
            onChanged: (String newVal) {
              setState(() {
                stateItem.combos.activePersPron = newVal;
                isAllCorrect = checkAnswer();
              });
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
      if (stateItem.combos.entryType == EntryTypes.Select) ...dropDowns(),
      if (stateItem.combos.entryType == EntryTypes.FreeForm) ...freeForms(),
      //if (stateItem.combos.entryType == EntryTypes.Mixed) ...getMixedForms(),
      if (stateItem.combos.sentenceEnder != '')
        Text(
          stateItem.combos.sentenceEnder,
          style: TextStyle(fontSize: EXERCISE_FONT_STYLE),
        ),
    ];

    return ExerciseRowCard(
      isAllCorrect: isAllCorrect,
      isPlural: stateItem.combos.isPlural,
      isAnimate: stateItem.combos.noun == null
          ? false
          : stateItem.combos.noun!.isAnimate,
      children: sentenceContent,
      gender: stateItem.combos.gender,
    );
  }
}
