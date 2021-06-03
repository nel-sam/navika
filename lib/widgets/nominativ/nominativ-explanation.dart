import 'package:flutter/material.dart';
import 'package:navika/models/constants.dart';
import 'package:navika/widgets/shared/explanation-popup-base.dart';
import 'package:navika/widgets/shared/explanation-text-cell.dart';

class NominativExplanation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ExplanationPopupBase(
      title: 'Nominativ',
      masculineSingular: ExplanationTextCell(children: [
        TextSpan(text: 'Mal'),
        TextSpan(text: 'i', style: DECLINED_LETTER_STYLE),
        TextSpan(text: ' čaj'),
      ]),
      feminineSingular: ExplanationTextCell(children: [
        TextSpan(text: 'Mal'),
        TextSpan(text: 'a', style: DECLINED_LETTER_STYLE),
        TextSpan(text: ' karta'),
      ]),
      neuterSingular: ExplanationTextCell(children: [
        TextSpan(text: 'Mal'),
        TextSpan(text: 'o', style: DECLINED_LETTER_STYLE),
        TextSpan(text: ' pismo'),
      ]),
      masculinePlural: ExplanationTextCell(children: [
        TextSpan(text: 'Mal'),
        TextSpan(text: 'i', style: DECLINED_LETTER_STYLE),
        TextSpan(text: ' čajevi'),
      ]),
      femininePlural: ExplanationTextCell(children: [
        TextSpan(text: 'Mal'),
        TextSpan(text: 'e', style: DECLINED_LETTER_STYLE),
        TextSpan(text: ' karte'),
      ]),
      neuterPlural: ExplanationTextCell(children: [
        TextSpan(text: 'Mal'),
        TextSpan(text: 'a', style: DECLINED_LETTER_STYLE),
        TextSpan(text: ' pisma'),
      ]),
      pronounMasculineSingular:
          ExplanationTextCell(children: [TextSpan(text: 'Moj čaj')]),
      pronounFeminineSingular: ExplanationTextCell(children: [
        TextSpan(text: 'Moj'),
        TextSpan(text: 'a', style: DECLINED_LETTER_STYLE),
        TextSpan(text: ' karta'),
      ]),
      pronounNeuterSingular: ExplanationTextCell(children: [
        TextSpan(text: 'Moj'),
        TextSpan(text: 'e', style: DECLINED_LETTER_STYLE),
        TextSpan(text: ' pismo'),
      ]),
      pronounMasculinePlural: ExplanationTextCell(children: [
        TextSpan(text: 'Moj'),
        TextSpan(text: 'i', style: DECLINED_LETTER_STYLE),
        TextSpan(text: ' čajevi'),
      ]),
      pronounFemininePlural: ExplanationTextCell(children: [
        TextSpan(text: 'Moj'),
        TextSpan(text: 'e', style: DECLINED_LETTER_STYLE),
        TextSpan(text: ' karte'),
      ]),
      pronounNeuterPlural: ExplanationTextCell(children: [
        TextSpan(text: 'Moj'),
        TextSpan(text: 'a', style: DECLINED_LETTER_STYLE),
        TextSpan(text: ' pisma'),
      ]),
    );
  }
}
