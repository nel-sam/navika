import 'package:flutter/material.dart';
import 'package:navika/constants.dart';
import 'package:navika/state/cases/case-question-state.dart';
import 'package:navika/widgets/exercises/declension/shared/case-exercise-row-card.dart';
import 'package:navika/widgets/shared/n-free-form-entry.dart';
import 'package:nrs_flutter_lib/extensions.dart';

class CaseQuestionContent extends StatefulWidget {
  final CaseQuestionState stateItem;

  CaseQuestionContent({
    required this.stateItem,
  });

  @override
  State<CaseQuestionContent> createState() => _CaseQuestionContentState();
}

class _CaseQuestionContentState extends State<CaseQuestionContent> {
  @override
  Widget build(BuildContext context) {
    bool isAllCorrect = widget.stateItem.isCorrect;
    final trans = widget.stateItem.combos.translation;

    handleOnChange(String newValue, List<String> correctValues) {
      final isCorrect = correctValues.containsCaseInsensitive(newValue);
      widget.stateItem.updateUserInput(correctValues[0], newValue, isCorrect);

      if (widget.stateItem.isCorrect) {
        setState(() {
          isAllCorrect = true;
        });
      }
    }

    return CaseExerciseRowCard(
      combos: widget.stateItem.combos,
      isAllCorrect: isAllCorrect,
      isPlural: widget.stateItem.combos.isPlural,
      isAnimate: widget.stateItem.combos.isAnimate,
      extraInfo: widget.stateItem.combos.extraInfo,
      translation: trans,
      children: [
        ...widget.stateItem.combos.sentenceParts.map((e) {
          if (!e.isCorrectable) {
            return Padding(
              padding: const EdgeInsets.only(right: 8),
              child: Text(
                e.displayValue,
                style: TextStyle(fontSize: EXERCISE_FONT_SIZE),
              ),
            );
          }

          final currentVal = widget.stateItem.getUserInput(e.correctValues[0]);

          return Padding(
            padding: const EdgeInsets.only(right: 8),
            child: NFreeFormEntry(
              hintValue: e.displayValue,
              initialValue: currentVal,
              correctValues: e.correctValues,
              onChanged: (String newVal) {
                handleOnChange(newVal, e.correctValues);
              },
            ),
          );
        }).toList()
      ],
      gender: widget.stateItem.combos.gender,
    );
  }
}
