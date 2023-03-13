import 'package:flutter/material.dart';
import 'package:navika/models/enums.dart';
import 'package:navika/models/verb.dart';
import 'package:navika/utilities/navika-helpers.dart';
import 'package:navika/widgets/exercises/verbs/shared/verb-help-guide.dart';
import 'package:nrs_flutter_lib/constants.dart';
import 'package:nrs_flutter_lib/nrs_flutter_lib.dart';

class VerbHeader extends StatelessWidget {
  final Verb verb;
  final bool isAllCorrect;

  const VerbHeader({
    Key? key,
    required this.verb,
    required this.isAllCorrect,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var translation = verb.getTranslation(context);
    var perfectiveness = getPerfectiveness(context, verb.verbPerfectiveType);

    // TODO: Make this look better
    return Container(
      padding: EdgeInsets.fromLTRB(12, 20, 12, 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 18.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(
                              this.verb.isIrregular
                                  ? '$perfectiveness, ${N.t('irregular')}'
                                  : perfectiveness,
                              style: Nrs.getTextStyle(
                                  context: context,
                                  isItalic: true,
                                  fontSize: FONT_SIZE - 4),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 6),
                          child: Text(
                            '${verb.infinitive.toUpperCase()} - $translation',
                            style: Nrs.getTextStyle(
                                context: context,
                                isBold: true,
                                fontSize: 16 * 1.3,
                                color:
                                    isAllCorrect ? CORRECT_COLOR : Colors.grey),
                          ),
                        ),
                        if (isAllCorrect)
                          Icon(CORRECT_ANSWER_ICON, color: CORRECT_COLOR)
                      ],
                    ),
                  ),
                ],
              )
            ],
          ),
          Column(
            children: [
              IconButton(
                icon: Icon(Icons.info),
                color: Nrs.getPrimaryColor(context),
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

  String getPerfectiveness(
      BuildContext context, VerbPerfectiveTypes verbPerfectiveType) {
    switch (verbPerfectiveType) {
      case VerbPerfectiveTypes.Perfective:
        return N.t('perfective');
      case VerbPerfectiveTypes.Imperfective:
        return N.t('imperfective');
      case VerbPerfectiveTypes.Unspecified:
        return '';
    }
  }
}
