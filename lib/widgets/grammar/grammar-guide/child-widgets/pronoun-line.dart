import 'package:flutter/material.dart';
import 'package:navika/models/enums.dart';
import 'package:navika/utilities/navika-helpers.dart';
import 'package:navika/widgets/shared/navika-text-multi.dart';
import 'package:navika/widgets/shared/navika-text.dart';

class PronounLine extends StatelessWidget {
  final PronounEnum pronoun;
  final NTextMulti text;

  const PronounLine({
    Key? key,
    required this.pronoun,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final labelText = N.getPronounLabel(pronoun, context);

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 0, 10, 0),
            child: Container(
              height: 30,
              decoration: BoxDecoration(
                border: Border(
                    right: BorderSide(
                  width: 2,
                  color: Colors.grey,
                )),
              ),
              width: 100,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 10, 0),
                child: Align(
                  alignment: Alignment.centerRight,
                  child: NText(labelText),
                ),
              ),
            ),
          ),
          text
        ],
      ),
    );
  }
}
