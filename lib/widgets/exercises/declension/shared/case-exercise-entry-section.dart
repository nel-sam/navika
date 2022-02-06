import 'package:flutter/material.dart';
import 'package:navika/models/enums.dart';
import 'package:navika/state/cases/case-notifier.dart';
import 'package:navika/widgets/exercises/declension/shared/case-question-content.dart';
import 'package:provider/provider.dart';

class CaseExerciseEntrySection extends StatelessWidget {
  final Function() getActive;

  const CaseExerciseEntrySection({
    Key? key,
    required this.getActive,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ChangeNotifierProvider<CaseNotifier>(
        create: (context) => CaseNotifier(getActive),
        child: Consumer<CaseNotifier>(
          builder: (context, cNotifier, child) => CaseQuestionContent(
            stateItem: cNotifier.getStateItem(),
            entryType: EntryTypes.FreeForm,
            onChanged: (GrammarTypes grammarType, String newValue) {
              switch (grammarType) {
                case GrammarTypes.Noun:
                  cNotifier.updateNoun(newValue);
                  break;
                case GrammarTypes.PersonalPronoun:
                  cNotifier.updatePersPronoun(newValue);
                  break;
                case GrammarTypes.PossesivePronoun:
                  cNotifier.updatePossPronoun(newValue);
                  break;
                case GrammarTypes.Adjective:
                  cNotifier.updateAdj(newValue);
                  break;
              }
            },
          ),
        ),
      ),
    );
  }
}
