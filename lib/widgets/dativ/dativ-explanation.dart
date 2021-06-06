import 'package:flutter/material.dart';
import 'package:navika/constants.dart';
import 'package:navika/widgets/shared/explanation-popup-base.dart';
import 'package:navika/widgets/shared/explanation-text-cell.dart';

class DativExplanation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ExplanationPopupBase(
      title: 'Dativ',
      masculineSingular: ExplanationTextCell(children: [
        TextSpan(text: 'Ukusn'),
        TextSpan(text: 'om', style: DECLINED_LETTER_STYLE),
        TextSpan(text: ' čaj'),
        TextSpan(text: 'u', style: DECLINED_LETTER_STYLE),
      ]),
      feminineSingular: ExplanationTextCell(children: [
        TextSpan(text: 'Lijep'),
        TextSpan(text: 'oj', style: DECLINED_LETTER_STYLE),
        TextSpan(text: ' mačk'),
        TextSpan(text: 'i', style: DECLINED_LETTER_STYLE),
      ]),
      neuterSingular: ExplanationTextCell(children: [
        TextSpan(text: 'Hladn'),
        TextSpan(text: 'om', style: DECLINED_LETTER_STYLE),
        TextSpan(text: ' jezer'),
        TextSpan(text: 'u', style: DECLINED_LETTER_STYLE),
      ]),
      masculinePlural: ExplanationTextCell(children: [
        TextSpan(text: 'Ukusn'),
        TextSpan(text: 'im', style: DECLINED_LETTER_STYLE),
        TextSpan(text: ' čajevi'),
        TextSpan(text: 'ma', style: DECLINED_LETTER_STYLE),
      ]),
      femininePlural: ExplanationTextCell(children: [
        TextSpan(text: 'Lijep'),
        TextSpan(text: 'im', style: DECLINED_LETTER_STYLE),
        TextSpan(text: ' mačka'),
        TextSpan(text: 'ma', style: DECLINED_LETTER_STYLE),
      ]),
      neuterPlural: ExplanationTextCell(children: [
        TextSpan(text: 'Hladn'),
        TextSpan(text: 'im', style: DECLINED_LETTER_STYLE),
        TextSpan(text: ' jezer'),
        TextSpan(text: 'ima', style: DECLINED_LETTER_STYLE),
      ]),
      pronounMasculineSingular: ExplanationTextCell(children: [
        TextSpan(text: 'Svo'),
        TextSpan(text: 'm', style: DECLINED_LETTER_STYLE),
        TextSpan(text: ' čaj'),
        TextSpan(text: 'u', style: DECLINED_LETTER_STYLE),
      ]),
      pronounFeminineSingular: ExplanationTextCell(children: [
        TextSpan(text: 'Svoj'),
        TextSpan(text: 'oj', style: DECLINED_LETTER_STYLE),
        TextSpan(text: ' mačk'),
        TextSpan(text: 'i', style: DECLINED_LETTER_STYLE),
      ]),
      pronounNeuterSingular: ExplanationTextCell(children: [
        TextSpan(text: 'Svo'),
        TextSpan(text: 'm', style: DECLINED_LETTER_STYLE),
        TextSpan(text: ' jezer'),
        TextSpan(text: 'u', style: DECLINED_LETTER_STYLE),
      ]),
      pronounMasculinePlural: ExplanationTextCell(children: [
        TextSpan(text: 'Svoj'),
        TextSpan(text: 'im', style: DECLINED_LETTER_STYLE),
        TextSpan(text: ' čajevi'),
        TextSpan(text: 'ma', style: DECLINED_LETTER_STYLE),
      ]),
      pronounFemininePlural: ExplanationTextCell(children: [
        TextSpan(text: 'Svoj'),
        TextSpan(text: 'im', style: DECLINED_LETTER_STYLE),
        TextSpan(text: ' mačka'),
        TextSpan(text: 'ma', style: DECLINED_LETTER_STYLE),
      ]),
      pronounNeuterPlural: ExplanationTextCell(children: [
        TextSpan(text: 'Svoj'),
        TextSpan(text: 'im', style: DECLINED_LETTER_STYLE),
        TextSpan(text: ' jezer'),
        TextSpan(text: 'ima', style: DECLINED_LETTER_STYLE),
      ]),
    );
  }
}
