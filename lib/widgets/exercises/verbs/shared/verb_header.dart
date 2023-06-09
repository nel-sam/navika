import 'package:flutter/material.dart';
import 'package:navika/models/enums.dart';
import 'package:navika/models/verb.dart';
import 'package:navika/utilities/navika_helpers.dart';
import 'package:navika/widgets/exercises/verbs/shared/verb_help_guide.dart';
import 'package:nrs_flutter_lib/constants.dart';

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

    return Container(
      padding: EdgeInsets.fromLTRB(12, 20, 12, 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 18.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(this.verb.isIrregular
                            ? '$perfectiveness${perfectiveness == '' ? '' : ','} ${N.t('irregular')}'
                            : perfectiveness),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: Wrap(
                        verticalDirection: VerticalDirection.up,
                        children: [
                          Text(
                            '${verb.infinitive.toUpperCase()} - ',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: Theme.of(context)
                                    .textTheme
                                    .bodyLarge!
                                    .fontSize,
                                color: isAllCorrect
                                    ? CORRECT_COLOR
                                    : Theme.of(context).colorScheme.onSurface),
                          ),
                          Text(
                            '$translation',
                            style: TextStyle(
                              fontSize: Theme.of(context)
                                  .textTheme
                                  .bodyLarge!
                                  .fontSize,
                            ),
                          )
                        ],
                      ),
                    ),
                    if (isAllCorrect)
                      Icon(CORRECT_ANSWER_ICON, color: CORRECT_COLOR)
                  ],
                ),
              )
            ],
          ),
          Column(
            children: [
              IconButton(
                icon: Icon(Icons.info),
                color: Theme.of(context).colorScheme.primary,
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
