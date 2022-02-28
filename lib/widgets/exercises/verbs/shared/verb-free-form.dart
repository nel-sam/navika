import 'package:flutter/material.dart';
import 'package:navika/constants.dart';
import 'package:navika/models/enums.dart';
import 'package:navika/models/verb.dart';
import 'package:navika/utilities/navika-helpers.dart';
import 'package:navika/widgets/shared/n-free-form-entry.dart';
import 'package:nrs_flutter_lib/nrs_flutter_lib.dart';
import 'package:nrs_flutter_lib/widgets/n-icon-text-pair.dart';

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
    double screenWidth = Nrs.getScreenWidth();

    return Container(
      width: (screenWidth / 2) - 14,
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
                  NIconTextPair(
                    icon: N.getGenderIcon(gender),
                    text:
                        '${N.getGenderString(context, gender).substring(0, 3)}.',
                  ),
              ],
            ),
            NFreeFormEntry(
              isHalfWidth: true,
              hintValue: this.verb.infinitive,
              onChanged: (String newValue) =>
                  this.onChanged(stateKey, newValue),
              initialValue: this.activeValue,
              correctValues: this.correctValues,
            ),
          ],
        ),
      ),
    );
  }
}
