import 'package:flutter/material.dart';
import 'package:navika/constants.dart';
import 'package:navika/lang_data/word-bank.dart';
import 'package:navika/models/enums.dart';
import 'package:navika/models/models.dart';
import 'package:navika/utilities/navika-helpers.dart';
import 'package:navika/widgets/shared/footer.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:navika/widgets/shared/navika-banner.dart';

String getSentenceStarter(Noun noun, bool isPlural) {
  final tense = N.getRandomTense();

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
  var listItems = N.getPANCombos(
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
        backgroundColor: N.getAppBarColor(context),
        textTheme: N.getAppBarTextTheme(context),
        iconTheme: N.getAppBarIconTheme(context),
        title: Text('Nominativ'),
      ),
      body: Center(
        child: ListView(
          padding: const EdgeInsets.all(8),
          children: [
            NavikaBanner(
                imagePath: CaseImagePaths[CaseTypeEnum.Nominativ]!,
                caseName: 'Nominativ',
                description: AppLocalizations.of(context)!.nominativDescription,
                icons: [
                  Icons.category_outlined,
                  Icons.nature,
                  Icons.people,
                ]),
            ...N.getPANListItems(widget.listItems, CaseTypeEnum.Nominativ)
          ],
        ),
      ),
      persistentFooterButtons: NavikaChildFooterButtons(
        context: context,
        caseType: CaseTypeEnum.Nominativ,
        refreshFunction: () => setState(() {
          widget.listItems = N.getPANCombos(
            wordBank,
            getSentenceStarter,
          );
        }),
      ),
    );
  }
}
