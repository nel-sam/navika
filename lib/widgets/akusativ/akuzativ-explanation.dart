import 'package:flutter/material.dart';
import 'package:navika/constants.dart';
import 'package:navika/widgets/shared/explanation-popup-base.dart';
import 'package:navika/widgets/shared/explanation-text-cell.dart';

class AkuzativExplanation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ExplanationPopupBase(
      title: 'Akuzativ',
      masculineSingular: ExplanationTextCell(children: [
        TextSpan(text: 'Velik'),
        TextSpan(text: 'i', style: DECLINED_LETTER_STYLE),
        TextSpan(text: ' mjesec'),
      ]),
      feminineSingular: ExplanationTextCell(children: [
        TextSpan(text: 'Velik'),
        TextSpan(text: 'u', style: DECLINED_LETTER_STYLE),
        TextSpan(text: ' mačku'),
      ]),
      neuterSingular: ExplanationTextCell(children: [
        TextSpan(text: 'Velik'),
        TextSpan(text: 'o', style: DECLINED_LETTER_STYLE),
        TextSpan(text: ' sunce'),
      ]),
      masculinePlural: ExplanationTextCell(children: [
        TextSpan(text: 'Velik'),
        TextSpan(text: 'e', style: DECLINED_LETTER_STYLE),
        TextSpan(text: ' mjesece'),
      ]),
      femininePlural: ExplanationTextCell(children: [
        TextSpan(text: 'Velik'),
        TextSpan(text: 'e', style: DECLINED_LETTER_STYLE),
        TextSpan(text: ' mačke'),
      ]),
      neuterPlural: ExplanationTextCell(children: [
        TextSpan(text: 'Velik'),
        TextSpan(text: 'a', style: DECLINED_LETTER_STYLE),
        TextSpan(text: ' sunca'),
      ]),
      pronounMasculineSingular: ExplanationTextCell(children: [
        TextSpan(text: 'Moj mjesec'),
      ]),
      pronounFeminineSingular: ExplanationTextCell(children: [
        TextSpan(text: 'Moj'),
        TextSpan(text: 'u', style: DECLINED_LETTER_STYLE),
        TextSpan(text: ' mačku'),
      ]),
      pronounNeuterSingular: ExplanationTextCell(children: [
        TextSpan(text: 'Moj'),
        TextSpan(text: 'e', style: DECLINED_LETTER_STYLE),
        TextSpan(text: ' sunce'),
      ]),
      pronounMasculinePlural: ExplanationTextCell(children: [
        TextSpan(text: 'Moj'),
        TextSpan(text: 'e', style: DECLINED_LETTER_STYLE),
        TextSpan(text: ' mjesece'),
      ]),
      pronounFemininePlural: ExplanationTextCell(children: [
        TextSpan(text: 'Moj'),
        TextSpan(text: 'e', style: DECLINED_LETTER_STYLE),
        TextSpan(text: ' mačke'),
      ]),
      pronounNeuterPlural: ExplanationTextCell(children: [
        TextSpan(text: 'Moj'),
        TextSpan(text: 'a', style: DECLINED_LETTER_STYLE),
        TextSpan(text: ' sunca'),
      ]),
    );
  }
}
