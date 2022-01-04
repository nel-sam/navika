import 'package:flutter/material.dart';
import 'package:navika/constants.dart';
import 'package:navika/models/enums.dart';
import 'package:navika/models/verb.dart';
import 'package:navika/utilities/navika-helpers.dart';
import 'package:navika/widgets/shared/icon-text-pair.dart';
import 'package:navika/widgets/shared/question-free-form.dart';

class VerbFreeForm extends StatelessWidget {
  final String startText;
  final String activeValue;
  final List<String> correctValues;
  final String stateKey;
  final Genders gender;
  final Verb verb;
  final Function(String key, String newValue) onChanged;

  const VerbFreeForm({
    Key? key,
    required this.startText,
    required this.activeValue,
    required this.correctValues,
    required this.gender,
    required this.verb,
    required this.onChanged,
    required this.stateKey,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Container(
      width: (screenWidth / 2) - 10,
      child: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  this.startText,
                  style: TextStyle(fontSize: EXERCISE_FONT_STYLE),
                ),
                if (this.gender != Genders.Unspecific)
                  IconTextPair(
                    icon: N.getGenderIcon(gender),
                    text:
                        '${N.getGenderString(context, gender).substring(0, 3)}.',
                  ),
              ],
            ),
            QuestionFreeForm(
              hintValue: this.verb.infinitive,
              onChanged: (String newValue) =>
                  this.onChanged(stateKey, newValue),
              activeValue: this.activeValue,
              correctValues: this.correctValues,
            ),
          ],
        ),
      ),
    );
  }
}
