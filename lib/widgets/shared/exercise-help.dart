import 'package:flutter/material.dart';
import 'package:navika/constants.dart';
import 'package:navika/models/adjective.dart';
import 'package:navika/models/enums.dart';
import 'package:navika/models/models.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:navika/models/noun.dart';
import 'package:navika/utilities/navika-helpers.dart';
import 'package:navika/widgets/grammar-guide/child-widgets/declension-table-cell.dart';
import 'package:navika/widgets/grammar-guide/child-widgets/declension-table.dart';
import 'package:navika/widgets/grammar-guide/child-widgets/navika-subheader.dart';
import 'package:navika/widgets/shared/navika-text.dart';

class ExerciseHelp extends StatelessWidget {
  final PANCombo combos;

  const ExerciseHelp({
    Key? key,
    required this.combos,
  }) : super(key: key);

  getAdjDeclensionTable(Adjective adj, Cases caseType, bool isAnimate) {
    final declensions = adj.getDeclensionObject(caseType, isAnimate);

    return Padding(
      padding: const EdgeInsets.only(top: 28.0),
      child: Column(
        children: [
          NText([
            N.NTextSpan(adj.dictionary, isBold: true),
          ]),
          DeclensionTable(
            masculineSingular: getTableCell(
              declensions.masculine.singular,
              combos.gender == Genders.Masculine && !combos.isPlural,
            ),
            feminineSingular: getTableCell(
              declensions.feminine.singular,
              combos.gender == Genders.Feminine && !combos.isPlural,
            ),
            neuterSingular: getTableCell(
              declensions.neuter.singular,
              combos.gender == Genders.Neuter && !combos.isPlural,
            ),
            masculinePlural: getTableCell(
              declensions.masculine.plural,
              combos.gender == Genders.Masculine && combos.isPlural,
            ),
            femininePlural: getTableCell(
              declensions.feminine.plural,
              combos.gender == Genders.Feminine && combos.isPlural,
            ),
            neuterPlural: getTableCell(
              declensions.neuter.plural,
              combos.gender == Genders.Neuter && combos.isPlural,
            ),
          ),
        ],
      ),
    );
  }

  getNounDeclensionTable(BuildContext context, Noun noun, Cases caseType) {
    final declensions = noun.getDeclensionObject(caseType);

    return Column(
      children: [
        NSubHeader(text: '${noun.dictionary}\n'),
        NText(
          [
            N.NTextSpan('${AppLocalizations.of(context)!.singular}: ',
                isBold: true),
            ...declensions.singular.map((e) => N.NTextSpan('$e ')).toList(),
            N.NTextSpan('\n${AppLocalizations.of(context)!.plural}: ',
                isBold: true),
            ...declensions.plural.map((e) => N.NTextSpan('$e ')).toList()
          ],
        ),
      ],
    );
  }

  DeclensionTableCell getTableCell(List<String> declensions, bool highlight) {
    return DeclensionTableCell(
      children: declensions.map((e) => N.NTextSpan('$e\n')).toList(),
      highlightItem: highlight,
    );
  }

  getCorrectSentence(BuildContext context, PANCombo combo) {
    return Column(
      children: [
        NSubHeader(text: AppLocalizations.of(context)!.correctAnswer),
        NText([
          if (combo.sentenceStarter != '')
            N.NTextSpan('${combo.sentenceStarter} '),
          if (combo.possPronoun != null)
            N.NTextSpan(
                '${combo.possPronoun!.getDeclensions(combos.gender, combos.isPlural, combos.caseType, combos.noun!.isAnimate).join('/')} '),
          if (combo.adjective != null)
            N.NTextSpan(
                '${combo.adjective!.getDeclensions(combos.gender, combos.isPlural, combos.caseType, combos.noun!.isAnimate).join('/')} '),
          if (combo.noun != null)
            N.NTextSpan(
                '${combo.noun!.getDeclensions(combos.isPlural, combos.caseType).join('/')}'),
        ]),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Builder(builder: (BuildContext context) => BackButton()),
        elevation: APPBAR_ELEVATION,
        backgroundColor: N.getAppBarColor(context),
        textTheme: N.getAppBarTextTheme(context),
        iconTheme: N.getAppBarIconTheme(context),
        title: Text(N.getCaseLabel(combos.caseType)),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              children: [
                getCorrectSentence(context, combos),
                if (combos.possPronoun != null)
                  getAdjDeclensionTable(
                    combos.possPronoun!,
                    combos.caseType,
                    combos.noun!.isAnimate,
                  ),
                if (combos.adjective != null)
                  getAdjDeclensionTable(
                    combos.adjective!,
                    combos.caseType,
                    combos.noun!.isAnimate,
                  ),
                if (combos.noun != null)
                  getNounDeclensionTable(
                    context,
                    combos.noun!,
                    combos.caseType,
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
