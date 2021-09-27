import 'package:flutter/material.dart';
import 'package:navika/constants.dart';
import 'package:navika/models/enums.dart';
import 'package:navika/models/verb.dart';
import 'package:navika/utilities/navika-helpers.dart';
import 'package:navika/widgets/shared/icon-text-pair.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class VerbQuestionContent extends StatelessWidget {
  final Verb verb;
  final Genders gender;
  final bool isPlural;
  final bool isAllCorrect;
  final Function(String) onChanged;

  const VerbQuestionContent({
    Key? key,
    required this.verb,
    required this.gender,
    required this.isPlural,
    required this.isAllCorrect,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          getHeader(context, verb),
        ],
      ),
    );
  }

  Widget getHeader(BuildContext context, Verb verb) {
    return Padding(
      padding: const EdgeInsets.only(top: 4, left: 10, right: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: this.isAllCorrect
                ? Icon(Icons.check_circle_outline, color: CORRECT_COLOR)
                : Icon(Icons.close_outlined, color: WRONG_COLOR),
          ),
          IconTextPair(
            icon: N.getGenderIcon(this.gender),
            text: N.getGenderString(context, this.gender),
          ),
          IconTextPair(
            icon: isPlural ? PLURAL_ICON : SINGULAR_ICON,
            text: isPlural
                ? AppLocalizations.of(context)!.plural
                : AppLocalizations.of(context)!.singular,
          ),
          // ElevatedButton(
          //     onPressed: () => {
          //           Navigator.push(
          //             context,
          //             MaterialPageRoute(
          //               builder: (context) => CaseExerciseHelp(combos: combos),
          //             ),
          //           ),
          //         },
          //     child: Icon(Icons.help)),
        ],
      ),
    );
  }
}
