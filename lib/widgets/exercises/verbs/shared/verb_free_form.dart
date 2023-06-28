import 'package:flutter/material.dart';
import 'package:navika/models/enums.dart';
import 'package:navika/models/verb.dart';
import 'package:navika/utilities/navika_helpers.dart';
import 'package:nrs_flutter_lib/constants.dart';
import 'package:nrs_flutter_lib/widgets/n_free_form_entry.dart';
import 'package:nrs_flutter_lib/widgets/n_icon_text_pair.dart';

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
    return Padding(
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
                style: TextStyle(fontSize: FONT_SIZE),
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
            isAnswerCentered: false,
            widthType: NFreeFormWidths.half,
            hintValue: this.correctValues.first,
            onChanged: (String newValue) => this.onChanged(stateKey, newValue),
            initialValue: this.activeValue,
            correctValues: this.correctValues,
          ),
        ],
      ),
    );
  }
}
