import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:navika/models/constants.dart';
import 'package:navika/models/enums.dart';
import 'package:navika/utilities/widget-helpers.dart';
import 'package:navika/widgets/shared/explanation-popup-base.dart';

class NominativExplanation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ExplanationPopupBase(
      title: 'Nominativ',
      content: OrientationBuilder(builder: (context, orientation) {
        return GridView.count(
            primary: false,
            padding: const EdgeInsets.all(20),
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            crossAxisCount: orientation == Orientation.portrait ? 1 : 2,
            children: [
              getPronounTable(context),
              getAdjTable(context),
            ]);
      }),
    );
  }

  getAdjTable(BuildContext context) {
    return Column(
      children: [
        Padding(padding: EdgeInsets.all(10.0)),
        Text(AppLocalizations.of(context)!.adjectives),
        Table(
          border: TABLE_BORDERS,
          columnWidths: const <int, TableColumnWidth>{
            0: FlexColumnWidth(1),
            1: FlexColumnWidth(1),
            2: FlexColumnWidth(1),
            4: FlexColumnWidth(1),
          },
          children: <TableRow>[
            TableRow(
              children: <Widget>[
                Container(),
                ExplanationIconCell(
                    icon: WidgetHelpers.getGenderIcon(GenderEnum.Masculine)),
                ExplanationIconCell(
                    icon: WidgetHelpers.getGenderIcon(GenderEnum.Feminine)),
                ExplanationIconCell(
                    icon: WidgetHelpers.getGenderIcon(GenderEnum.Neuter)),
              ],
            ),
            TableRow(children: [
              ExplanationIconCell(icon: SINGULAR_ICON),
              ExplanationTextCell(children: [
                TextSpan(text: 'Mal'),
                TextSpan(
                    text: 'i', style: TextStyle(fontWeight: FontWeight.bold)),
                TextSpan(text: ' čaj'),
              ]),
              ExplanationTextCell(children: [
                TextSpan(text: 'Mal'),
                TextSpan(
                    text: 'a', style: TextStyle(fontWeight: FontWeight.bold)),
                TextSpan(text: ' karta'),
              ]),
              ExplanationTextCell(children: [
                TextSpan(text: 'Mal'),
                TextSpan(
                    text: 'o', style: TextStyle(fontWeight: FontWeight.bold)),
                TextSpan(text: ' pismo'),
              ]),
            ]),
            TableRow(children: [
              ExplanationIconCell(icon: PLURAL_ICON),
              ExplanationTextCell(children: [
                TextSpan(text: 'Mal'),
                TextSpan(
                    text: 'i', style: TextStyle(fontWeight: FontWeight.bold)),
                TextSpan(text: ' čajevi'),
              ]),
              ExplanationTextCell(children: [
                TextSpan(text: 'Mal'),
                TextSpan(
                    text: 'e', style: TextStyle(fontWeight: FontWeight.bold)),
                TextSpan(text: ' karte'),
              ]),
              ExplanationTextCell(children: [
                TextSpan(text: 'Mal'),
                TextSpan(
                    text: 'a', style: TextStyle(fontWeight: FontWeight.bold)),
                TextSpan(text: ' pisma'),
              ]),
            ]),
          ],
        ),
      ],
    );
  }

  getPronounTable(BuildContext context) {
    return Column(
      children: [
        Text(AppLocalizations.of(context)!.pronouns),
        Padding(
          padding: const EdgeInsets.all(5),
          child: Table(
            border: TABLE_BORDERS,
            defaultVerticalAlignment: TableCellVerticalAlignment.middle,
            defaultColumnWidth: FlexColumnWidth(1),
            columnWidths: const <int, TableColumnWidth>{
              0: FixedColumnWidth(40),
            },
            children: <TableRow>[
              TableRow(
                children: <Widget>[
                  Container(),
                  ExplanationIconCell(
                      icon: WidgetHelpers.getGenderIcon(GenderEnum.Masculine)),
                  ExplanationIconCell(
                      icon: WidgetHelpers.getGenderIcon(GenderEnum.Feminine)),
                  ExplanationIconCell(
                      icon: WidgetHelpers.getGenderIcon(GenderEnum.Neuter)),
                ],
              ),
              TableRow(children: [
                ExplanationIconCell(icon: SINGULAR_ICON),
                ExplanationTextCell(children: [TextSpan(text: 'Moj čaj')]),
                ExplanationTextCell(children: [
                  TextSpan(text: 'Moj'),
                  TextSpan(
                      text: 'a', style: TextStyle(fontWeight: FontWeight.bold)),
                  TextSpan(text: ' karta'),
                ]),
                ExplanationTextCell(children: [
                  TextSpan(text: 'Moj'),
                  TextSpan(
                      text: 'e', style: TextStyle(fontWeight: FontWeight.bold)),
                  TextSpan(text: ' pismo'),
                ]),
              ]),
              TableRow(children: [
                ExplanationIconCell(icon: PLURAL_ICON),
                ExplanationTextCell(children: [
                  TextSpan(text: 'Moj'),
                  TextSpan(
                      text: 'i', style: TextStyle(fontWeight: FontWeight.bold)),
                  TextSpan(text: ' čajevi'),
                ]),
                ExplanationTextCell(children: [
                  TextSpan(text: 'Moj'),
                  TextSpan(
                      text: 'e', style: TextStyle(fontWeight: FontWeight.bold)),
                  TextSpan(text: ' karte'),
                ]),
                ExplanationTextCell(children: [
                  TextSpan(text: 'Moj'),
                  TextSpan(
                      text: 'a', style: TextStyle(fontWeight: FontWeight.bold)),
                  TextSpan(text: ' pisma'),
                ]),
              ]),
            ],
          ),
        ),
      ],
    );
  }
}

class ExplanationIconCell extends StatelessWidget {
  final IconData icon;

  const ExplanationIconCell({
    Key? key,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: TABLE_CELL_PADDING,
      child: TableCell(
        child: Container(
          child: Icon(
            icon,
            color: ICON_COLOR,
          ),
        ),
      ),
    );
  }
}

class ExplanationTextCell extends StatelessWidget {
  final List<TextSpan> children;

  const ExplanationTextCell({Key? key, required this.children})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: TABLE_CELL_PADDING,
      child: TableCell(
        child: Container(
          child: RichText(
            text: TextSpan(
              style: TABLE_CELL_TEXT_STYLE,
              children: children,
            ),
          ),
        ),
      ),
    );
  }
}
