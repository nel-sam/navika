import 'package:flutter/material.dart';
import 'package:navika/lang_data/word-bank.dart';
import 'package:navika/models/enums.dart';
import 'package:navika/models/models.dart';
import 'package:navika/utilities/widget-helpers.dart';
import 'package:navika/widgets/shared/explanation-button.dart';
import 'package:navika/widgets/shared/refresh-button.dart';
import '../../constants.dart';
import 'nominativ-explanation.dart';

String getSentenceStarter(Noun noun, bool isPlural) {
  final tense = WidgetHelpers.getRandomTense();

  if (noun.isAnimate && isPlural) {
    if (tense == TenseEnum.Past || tense == TenseEnum.Conditional)
      return noun.gender == GenderEnum.Feminine ? 'One su bile' : 'Oni su bili';

    return noun.gender == GenderEnum.Feminine ? 'One su' : 'Oni su';
  } else if (!noun.isAnimate && isPlural) {
    if (tense == TenseEnum.Future || tense == TenseEnum.Conditional)
      return 'To će biti';

    return 'To su';
  } else if (noun.isAnimate && !isPlural) {
    if (tense == TenseEnum.Past || tense == TenseEnum.Conditional)
      return noun.gender == GenderEnum.Feminine ? 'Ona će biti' : 'On će biti';

    return noun.gender == GenderEnum.Feminine ? 'Ona je' : 'On su';
  } else if (!noun.isAnimate && !isPlural) {
    if (tense == TenseEnum.Past ||
        tense == TenseEnum.Conditional) if (noun.gender == GenderEnum.Feminine)
      return 'To je bila';
    else if (noun.gender == GenderEnum.Masculine)
      return 'To je bio';
    else
      return 'To je bilo';
  }

  return 'To je';
}

// ignore: must_be_immutable
class NominativExercise extends StatefulWidget {
  final WordBank bank = wordBank;
  var listItems = WidgetHelpers.getPANCombos(
    wordBank,
    getSentenceStarter,
  );

  @override
  _NominativExerciseState createState() => _NominativExerciseState();
}

class _NominativExerciseState extends State<NominativExercise> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: APPBAR_ELEVATION,
        backgroundColor: WidgetHelpers.getAppBarColor(context),
        textTheme: WidgetHelpers.getAppBarTextTheme(context),
        iconTheme: WidgetHelpers.getAppBarIconTheme(context),
        title: Text('Nominativ'),
        actions: [
          Center(
            child: RefreshButton(
              refreshFunction: () => setState(() {
                widget.listItems = WidgetHelpers.getPANCombos(
                  wordBank,
                  getSentenceStarter,
                );
              }),
            ),
          ),
          Center(
            child: ExplanationButton(popupWidget: NominativExplanation()),
          )
        ],
      ),
      body: Center(
        child: ListView(
          padding: const EdgeInsets.all(8),
          children: WidgetHelpers.getPANListItems(
              widget.listItems, CaseTypeEnum.Nominativ),
        ),
      ),
    );
  }
}
