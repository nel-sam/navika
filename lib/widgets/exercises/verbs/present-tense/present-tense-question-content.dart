import 'dart:collection';

import 'package:navika/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:navika/models/verb.dart';
import 'package:navika/widgets/exercises/verbs/shared/verb-exercise.dart';
import 'package:navika/widgets/shared/navika-banner.dart';
import 'package:navika/widgets/shared/shadow-box.dart';

class PresentTenseQuestionContent extends StatelessWidget {
  final Verb verb;
  final bool isAllCorrect;
  final Function(ConjPronounTypes, String) onChanged;
  final HashMap<String, String> state;

  const PresentTenseQuestionContent({
    Key? key,
    required this.verb,
    required this.isAllCorrect,
    required this.onChanged,
    required this.state,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ShadowBox(
      isCorrect: isAllCorrect,
      child: Column(
        children: [
          getHeader(context, verb),
          getBody(context),
        ],
      ),
    );
  }
}
