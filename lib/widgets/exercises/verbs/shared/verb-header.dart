import 'package:flutter/material.dart';
import 'package:navika/constants.dart';
import 'package:navika/models/verb.dart';
import 'package:navika/utilities/navika-helpers.dart';
import 'package:navika/widgets/shared/navika-text.dart';

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
    String translation = verb.getTranslation(context);

    return Container(
      child: Padding(
        padding: const EdgeInsets.only(top: 14, left: 10, right: 10),
        child: Row(
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
              child: NText(
                  [N.NTextSpan(verb.infinitive, isBold: true, fontSize: 18)]),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 20, top: 5),
              child: NText([N.NTextSpan(translation, fontSize: 16)]),
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
      ),
    );
  }
}
