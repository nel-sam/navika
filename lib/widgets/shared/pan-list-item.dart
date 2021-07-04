import 'package:flutter/material.dart';
import 'package:navika/constants.dart';
import 'package:navika/models/enums.dart';
import 'package:navika/models/adjective.dart';
import 'package:navika/models/noun.dart';
import 'package:navika/models/personal-pronoun.dart';
import 'package:navika/utilities/navika-helpers.dart';
import 'package:navika/widgets/shared/case-drop-down.dart';
import 'package:navika/widgets/shared/case-free-form.dart';
import 'package:navika/widgets/shared/exercise-row-card.dart';

// ignore: must_be_immutable
class PANListItem extends StatefulWidget {
  final String sentenceStarter;
  final String sentenceEnder;

  final Adjective? possPronoun;
  final List<String>? correctPossProns;
  String? activePossPron;

  final Adjective? adjective;
  final List<String>? correctAdjs;
  String? activeAdj;

  final Noun? noun;
  final List<String>? correctNouns;
  String? activeNoun;

  final PersonalPronoun? personalPronoun;
  final List<String>? correctPersProns;
  String? activePersPron;

  final Genders gender;
  final bool isPlural;
  final CaseTypeEnum caseType;

  EntryTypes entryType;

  PANListItem({
    required this.sentenceStarter,
    required this.sentenceEnder,
    this.possPronoun,
    this.correctPossProns,
    this.activePossPron = '',
    this.adjective,
    this.correctAdjs,
    this.activeAdj = '',
    this.noun,
    this.activeNoun = '',
    this.correctNouns,
    this.personalPronoun,
    this.correctPersProns,
    this.activePersPron = '',
    required this.isPlural,
    required this.gender,
    required this.caseType,
    required this.entryType,
  });

  @override
  _PANListItemState createState() => _PANListItemState();
}

class _PANListItemState extends State<PANListItem> {
  bool checkAnswer() {
    final pos = isCorrect(widget.correctPossProns, widget.activePossPron);
    final adj = isCorrect(widget.correctAdjs, widget.activeAdj);
    final noun = isCorrect(widget.correctNouns, widget.activeNoun);
    final persPron = isCorrect(widget.correctPersProns, widget.activePersPron);

    return pos && adj && noun && persPron;
  }

  bool isCorrect(List<String>? acceptedAnswers, String? actualAnswer) {
    if (acceptedAnswers == null ||
        acceptedAnswers.length == 0 ||
        actualAnswer == null ||
        actualAnswer == '') {
      return true;
    }

    return acceptedAnswers.contains(actualAnswer);
  }

  @override
  Widget build(BuildContext context) {
    bool isAllCorrect = checkAnswer();

    final bool usePossPronouns = widget.possPronoun != null;
    final bool useAdj = widget.adjective != null;
    final bool useNoun = widget.noun != null;
    final bool usePersPron = widget.personalPronoun != null;

    dropDowns() {
      return [
        if (usePossPronouns)
          CaseDropDown(
            activeValue: widget.activePossPron!,
            correctValues: widget.correctPossProns!,
            dropDownOptions: N.getDropdownItems(adjective: widget.possPronoun!),
            onChanged: (String newVal) {
              setState(() {
                widget.activePossPron = newVal;
                isAllCorrect = checkAnswer();
              });
            },
          ),
        if (useAdj)
          CaseDropDown(
            activeValue: widget.activeAdj!,
            correctValues: widget.correctAdjs!,
            dropDownOptions: N.getDropdownItems(adjective: widget.adjective!),
            onChanged: (String newVal) {
              setState(() {
                widget.activeAdj = newVal;
                isAllCorrect = checkAnswer();
              });
            },
          ),
        if (useNoun)
          CaseDropDown(
            activeValue: widget.activeNoun!,
            correctValues: widget.correctNouns!,
            dropDownOptions: N.getDropdownItems(noun: widget.noun!),
            onChanged: (String newVal) {
              setState(() {
                widget.activeNoun = newVal;
                isAllCorrect = checkAnswer();
              });
            },
          ),
        if (usePersPron)
          CaseDropDown(
            activeValue: widget.activePersPron!,
            correctValues: widget.correctPersProns!,
            dropDownOptions:
                N.getDropdownItems(personalPronoun: widget.personalPronoun!),
            onChanged: (String newVal) {
              setState(() {
                widget.activePersPron = newVal;
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
            hintValue: widget.possPronoun!.dictionary,
            maxLength: widget.possPronoun!.longestForCase(widget.caseType),
            activeValue: widget.activePossPron!,
            correctValues: widget.correctPossProns!,
            onChanged: (String newVal) {
              setState(() {
                widget.activePossPron = newVal;
                isAllCorrect = checkAnswer();
              });
            },
          ),
        if (useAdj)
          CaseFreeForm(
            hintValue: widget.adjective!.dictionary,
            maxLength: widget.adjective!.longestForCase(widget.caseType),
            activeValue: widget.activeAdj!,
            correctValues: widget.correctAdjs!,
            onChanged: (String newVal) {
              setState(() {
                widget.activeAdj = newVal;
                isAllCorrect = checkAnswer();
              });
            },
          ),
        if (useNoun)
          CaseFreeForm(
            hintValue: widget.noun!.dictionary,
            maxLength: widget.noun!.longestForCase(widget.caseType),
            activeValue: widget.activeNoun!,
            correctValues: widget.correctNouns!,
            onChanged: (String newVal) {
              setState(() {
                widget.activeNoun = newVal;
                isAllCorrect = checkAnswer();
              });
            },
          ),
        if (usePersPron)
          CaseFreeForm(
            hintValue: widget.personalPronoun!.dictionary,
            maxLength: widget.personalPronoun!.longestForCase(widget.caseType),
            activeValue: widget.activePersPron!,
            correctValues: widget.correctPersProns!,
            onChanged: (String newVal) {
              setState(() {
                widget.activePersPron = newVal;
                isAllCorrect = checkAnswer();
              });
            },
          ),
      ];
    }

    // This is a deterministic function that still
    // tries to create variety in the exercises
    bool getIsFreeForm(int total, int i) {
      final baseWord = widget.personalPronoun != null
          ? widget.personalPronoun!.dictionary
          : widget.noun!.dictionary;

      if (total == 1 && widget.personalPronoun != null) {
        return widget.personalPronoun!.dictionary.contains('i');
      } else if (total == 1) {
        return widget.noun!.dictionary.indexOf('e') > i;
      } else if (total == 2) {
        return widget.noun!.dictionary.contains('n') ||
            (total * baseWord.length + 1) % (i + 1) == 0;
      } else if (widget.noun!.dictionary.contains('j')) {
        return (total + baseWord.length) % (i + 1) == 0;
      }

      var t = baseWord.length % (i + total) == 0;
      return widget.noun!.dictionary.contains('e') || t;
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
      if (widget.sentenceStarter != '')
        Text(
          widget.sentenceStarter,
          style: TextStyle(fontSize: EXERCISE_FONT_STYLE),
        ),
      if (widget.entryType == EntryTypes.Select) ...dropDowns(),
      if (widget.entryType == EntryTypes.FreeForm) ...freeForms(),
      if (widget.entryType == EntryTypes.Mixed) ...getMixedForms(),
      if (widget.sentenceEnder != '')
        Text(
          widget.sentenceEnder,
          style: TextStyle(fontSize: EXERCISE_FONT_STYLE),
        ),
    ];

    return ExerciseRowCard(
      isAllCorrect: isAllCorrect,
      isPlural: widget.isPlural,
      isAnimate: widget.noun == null ? false : widget.noun!.isAnimate,
      children: sentenceContent,
      gender: widget.gender,
    );
  }
}
