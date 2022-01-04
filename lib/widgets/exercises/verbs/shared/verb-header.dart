import 'package:flutter/material.dart';
import 'package:navika/constants.dart';
import 'package:navika/models/enums.dart';
import 'package:navika/models/verb.dart';
import 'package:navika/utilities/navika-helpers.dart';
import 'package:navika/widgets/shared/icon-text-pair.dart';
import 'package:navika/widgets/shared/navika-text.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class VerbHeader extends StatelessWidget {
  final Verb verb;
  final bool isAllCorrect;

  const VerbHeader({
    Key? key,
    required this.verb,
    required this.isAllCorrect,
  }) : super(key: key);

  String getPerfectiveness(
      BuildContext context, VerbPerfectiveTypes verbPerfectiveType) {
    switch (verbPerfectiveType) {
      case VerbPerfectiveTypes.Perfective:
        return AppLocalizations.of(context)!.perfective;
      case VerbPerfectiveTypes.Imperfective:
        return AppLocalizations.of(context)!.imperfective;
      case VerbPerfectiveTypes.Unspecified:
        return '';
    }
  }

  @override
  Widget build(BuildContext context) {
    var translation = verb.getTranslation(context);
    var perfectiveness = getPerfectiveness(context, verb.verbPerfectiveType);

    return Container(
      child: Padding(
        padding: const EdgeInsets.only(top: 14, left: 10, right: 10),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 20),
                  child: isAllCorrect
                      ? Icon(CORRECT_ANSWER_ICON, color: CORRECT_COLOR)
                      : Icon(WRONG_ANSWER_ICON, color: WRONG_COLOR),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 20),
                  child: NText([
                    N.NTextSpan(verb.infinitive, isBold: true, fontSize: 16)
                  ]),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 20, top: 2),
                  child: NText([N.NTextSpan(translation, fontSize: 16)]),
                ),
              ],
            ),
            Row(
              children: [
                // TODO: Improve styling
                Padding(
                  padding: const EdgeInsets.only(left: 44),
                  child: NText([N.NTextSpan(perfectiveness, fontSize: 16)]),
                ),
                if (this.verb.isIrregular)
                  Padding(
                    padding: const EdgeInsets.only(left: 30, right: 20, top: 2),
                    child: IconTextPair(
                      icon: Icons.error_outline,
                      text: AppLocalizations.of(context)!.irregular,
                    ),
                  ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
