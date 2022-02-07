import 'package:flutter/material.dart';
import 'package:navika/constants.dart';
import 'package:navika/models/enums.dart';
import 'package:navika/models/verb.dart';
import 'package:navika/utilities/navika-helpers.dart';
import 'package:navika/widgets/exercises/verbs/shared/verb-help-guide.dart';
import 'package:navika/widgets/shared/icon-text-pair.dart';
import 'package:navika/widgets/shared/navika-text-multi.dart';
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
      padding: EdgeInsets.all(12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              Row(
                children: [
                  isAllCorrect
                      ? Icon(CORRECT_ANSWER_ICON, color: CORRECT_COLOR)
                      : Icon(WRONG_ANSWER_ICON, color: WRONG_COLOR),
                  Padding(
                    padding: const EdgeInsets.only(left: 18.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        NTextMulti([
                          N.NTextSpan(verb.infinitive.toUpperCase(),
                              isBold: true, fontSize: 16)
                        ]),
                        Text(
                          perfectiveness,
                          style: TextStyle(fontStyle: FontStyle.italic),
                        ),
                      ],
                    ),
                  ),
                ],
              )
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              IconTextPair(
                text: translation,
                icon: Icons.translate,
              ),
              if (this.verb.isIrregular)
                IconTextPair(
                  icon: Icons.error_outline,
                  text: AppLocalizations.of(context)!.irregular,
                ),
            ],
          ),
          Column(
            children: [
              IconButton(
                icon: Icon(Icons.info),
                color: ACCENT_COLOR,
                onPressed: () {
                  final dest = VerbHelpGuide(
                    verb: verb,
                    perfectiveness: perfectiveness,
                  );

                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => dest,
                    ),
                  );
                },
              )
            ],
          )
        ],
      ),
    );
  }
}
