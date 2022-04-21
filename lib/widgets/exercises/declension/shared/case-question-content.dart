import 'package:flutter/material.dart';
import 'package:navika/constants.dart';
import 'package:navika/state/cases/case-question-state.dart';
import 'package:navika/widgets/exercises/declension/shared/case-exercise-row-card.dart';
import 'package:navika/widgets/shared/n-free-form-entry.dart';
import 'package:nrs_flutter_lib/enums.dart';
import 'package:nrs_flutter_lib/widgets/n_sub_header.dart';

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
    final trans = widget.stateItem.combos.getTrans != null
        ? widget.stateItem.combos.getTrans!()
        : '';

    handleOnChange(
        GrammarTypes grammarType, String newValue, List<String> correctValues) {
      final isCorrect = correctValues.contains(newValue);
      widget.stateItem.updateUserInput(grammarType.name, newValue, isCorrect);

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
            return Text(
              e.displayValue,
              style: TextStyle(fontSize: EXERCISE_FONT_STYLE),
            );
          }

          final currentVal = widget.stateItem.getUserInput(e.grammarType.name);

          return NFreeFormEntry(
            hintValue: e.displayValue,
            initialValue: currentVal,
            correctValues: e.correctValues,
            onChanged: (String newVal) {
              handleOnChange(e.grammarType, newVal, e.correctValues);
            },
          );
        }).toList()
      ],
      gender: widget.stateItem.combos.gender,
    );
  }
}
