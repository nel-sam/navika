import 'package:flutter/material.dart';
import 'package:navika/constants.dart';
import 'package:navika/widgets/shared/explanation-popup-base.dart';
import 'package:navika/widgets/shared/explanation-text-cell.dart';

class InstrumentalExplanation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ExplanationPopupBase(
      title: 'Instrumental',
      note: "č, ć, đ, dž, š, ž, lj, nj, j, št + em",
      masculineSingular: ExplanationTextCell(children: [
        TextSpan(text: 'Velik'),
        TextSpan(text: 'im', style: DECLINED_LETTER_STYLE),
        TextSpan(text: ' stol'),
        TextSpan(text: 'om', style: DECLINED_LETTER_STYLE),
        TextSpan(text: '/čaj'),
        TextSpan(text: 'em', style: DECLINED_LETTER_STYLE),
        TextSpan(text: '*'),
      ]),
      feminineSingular: ExplanationTextCell(children: [
        TextSpan(text: 'Velik'),
        TextSpan(text: 'om', style: DECLINED_LETTER_STYLE),
        TextSpan(text: ' cipel'),
        TextSpan(text: 'om', style: DECLINED_LETTER_STYLE),
      ]),
      neuterSingular: ExplanationTextCell(children: [
        TextSpan(text: 'Velik'),
        TextSpan(text: 'im', style: DECLINED_LETTER_STYLE),
        TextSpan(text: ' jezer'),
        TextSpan(text: 'om', style: DECLINED_LETTER_STYLE),
        TextSpan(text: '/kazališt'),
        TextSpan(text: 'em', style: DECLINED_LETTER_STYLE),
        TextSpan(text: '*'),
      ]),
      masculinePlural: ExplanationTextCell(children: [
        TextSpan(text: 'Velik'),
        TextSpan(text: 'im', style: DECLINED_LETTER_STYLE),
        TextSpan(text: ' stolov'),
        TextSpan(text: 'ima', style: DECLINED_LETTER_STYLE),
        TextSpan(text: '/čajev'),
        TextSpan(text: 'ima', style: DECLINED_LETTER_STYLE),
      ]),
      femininePlural: ExplanationTextCell(children: [
        TextSpan(text: 'Velik'),
        TextSpan(text: 'im', style: DECLINED_LETTER_STYLE),
        TextSpan(text: ' cipel'),
        TextSpan(text: 'ama', style: DECLINED_LETTER_STYLE),
      ]),
      neuterPlural: ExplanationTextCell(children: [
        TextSpan(text: 'Velik'),
        TextSpan(text: 'im', style: DECLINED_LETTER_STYLE),
        TextSpan(text: ' jezer'),
        TextSpan(text: 'ima', style: DECLINED_LETTER_STYLE),
      ]),
      pronounMasculineSingular: ExplanationTextCell(children: [
        TextSpan(text: 'Svoj'),
        TextSpan(text: 'im', style: DECLINED_LETTER_STYLE),
        TextSpan(text: ' stol'),
        TextSpan(text: 'om', style: DECLINED_LETTER_STYLE),
        TextSpan(text: '/čaj'),
        TextSpan(text: 'em*', style: DECLINED_LETTER_STYLE),
      ]),
      pronounFeminineSingular: ExplanationTextCell(children: [
        TextSpan(text: 'Svoj'),
        TextSpan(text: 'om', style: DECLINED_LETTER_STYLE),
        TextSpan(text: ' cipel'),
        TextSpan(text: 'om', style: DECLINED_LETTER_STYLE),
      ]),
      pronounNeuterSingular: ExplanationTextCell(children: [
        TextSpan(text: 'Velik'),
        TextSpan(text: 'im', style: DECLINED_LETTER_STYLE),
        TextSpan(text: ' jezer'),
        TextSpan(text: 'om', style: DECLINED_LETTER_STYLE),
        TextSpan(text: '/kazališt'),
        TextSpan(text: 'em', style: DECLINED_LETTER_STYLE),
        TextSpan(text: '*'),
      ]),
      pronounMasculinePlural: ExplanationTextCell(children: [
        TextSpan(text: 'Svoj'),
        TextSpan(text: 'im', style: DECLINED_LETTER_STYLE),
        TextSpan(text: ' stolov'),
        TextSpan(text: 'ima', style: DECLINED_LETTER_STYLE),
      ]),
      pronounFemininePlural: ExplanationTextCell(children: [
        TextSpan(text: 'Svoj'),
        TextSpan(text: 'im', style: DECLINED_LETTER_STYLE),
        TextSpan(text: ' cipel'),
        TextSpan(text: 'ama', style: DECLINED_LETTER_STYLE),
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
