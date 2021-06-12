import 'package:flutter/material.dart';
import 'package:navika/constants.dart';
import 'package:navika/utilities/widget-helpers.dart';
import 'package:navika/widgets/shared/explanation-popup-base.dart';
import 'package:navika/widgets/shared/explanation-text-cell.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:navika/widgets/shared/navika-subheader.dart';
import 'package:navika/widgets/shared/navika-textspan.dart';

class GenitivExplanation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: APPBAR_ELEVATION,
        backgroundColor: WidgetHelpers.getAppBarColor(context),
        textTheme: WidgetHelpers.getAppBarTextTheme(context),
        iconTheme: WidgetHelpers.getAppBarIconTheme(context),
        title: Text('Genitiv'),
      ),
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          children: [
            getDescription(context),
            getPronounSection(context),
          ],
        ),
      ),
    );
  }
}

Widget getPronounSection(BuildContext context) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.start,
    children: [
      Row(
        children: [NSubHeader(text: AppLocalizations.of(context)!.pronouns)],
      ),
      Row(children: [
        NTextSpan(text: 'On pleše'),
        NTextSpan(text: 'mene', isBold: true)
      ]),
      Row(children: [
        NTextSpan(text: 'Evo'),
        NTextSpan(text: 'me', isBold: true)
      ]),
      Row(children: [
        NTextSpan(text: 'Nisam spavala zbog'),
        NTextSpan(text: 'tebe', isBold: true)
      ]),
      Row(children: [
        NTextSpan(text: 'Evo'),
        NTextSpan(text: 'te', isBold: true)
      ]),
      Row(children: [
        NTextSpan(text: 'Ona stoji iza'),
        NTextSpan(text: 'njega', isBold: true)
      ]),
      Row(children: [
        NTextSpan(text: 'Nema'),
        NTextSpan(text: 'ga', isBold: true),
        NTextSpan(text: 'tu'),
      ]),
      Row(children: [
        NTextSpan(text: 'Oni su išli bez'),
        NTextSpan(text: 'nas', isBold: true)
      ]),
      Row(children: [
        NTextSpan(text: 'Moj brat stoji između nas i'),
        NTextSpan(text: 'vas', isBold: true)
      ]),
      Row(children: [
        NTextSpan(text: 'Bojim se'),
        NTextSpan(text: 'njih', isBold: true)
      ]),
      Row(children: [
        NTextSpan(text: 'Ja se'),
        NTextSpan(text: 'ih', isBold: true),
        NTextSpan(text: 'ne bojim'),
      ]),
    ],
  );
}

Widget getDescription(BuildContext context) {
  return Column(
    children: [
      NTextSpan(
        text: AppLocalizations.of(context)!.genitiveDescription,
        attachNewline: true,
      )
    ],
  );
}

ExplanationPopupBase getOldExp() {
  return ExplanationPopupBase(
    title: 'Genitiv UNDER CONSTRUCTION!!',
    note: '',
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
