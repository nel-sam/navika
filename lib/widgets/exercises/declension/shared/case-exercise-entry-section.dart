import 'package:flutter/material.dart';
import 'package:navika/models/enums.dart';
import 'package:navika/widgets/exercises/declension/shared/case-question-content.dart';

class CaseExerciseEntrySection extends StatelessWidget {
  final dynamic stateItem;

  const CaseExerciseEntrySection({
    Key? key,
    required this.stateItem,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CaseQuestionContent(
      stateItem: stateItem,
      entryType: EntryTypes.FreeForm,
      onChanged: (GrammarTypes grammarType, String newValue) {
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
      },
    );
  }
}
