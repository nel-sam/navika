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
      title: 'Nomitaiv',
      content: Column(children: [
        getAdjectiveTable(),
        getPronounTable(context),
      ]),
    );
  }

  getPronounTable(BuildContext context) {
    return Column(
      children: [
        Padding(padding: EdgeInsets.all(10.0)),
        Text(AppLocalizations.of(context)!.pronouns),
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
                getIconCell(WidgetHelpers.getGenderIcon(GenderEnum.Masculine)),
                getIconCell(WidgetHelpers.getGenderIcon(GenderEnum.Feminine)),
                getIconCell(WidgetHelpers.getGenderIcon(GenderEnum.Neuter)),
              ],
            ),
            TableRow(children: [
              getIconCell(SINGULAR_ICON),
              getTextCell([
                TextSpan(text: 'Mal'),
                TextSpan(
                    text: 'i', style: TextStyle(fontWeight: FontWeight.bold)),
                TextSpan(text: ' čaj'),
              ]),
              getTextCell([
                TextSpan(text: 'Mal'),
                TextSpan(
                    text: 'a', style: TextStyle(fontWeight: FontWeight.bold)),
                TextSpan(text: ' karta'),
              ]),
              getTextCell([
                TextSpan(text: 'Mal'),
                TextSpan(
                    text: 'o', style: TextStyle(fontWeight: FontWeight.bold)),
                TextSpan(text: ' pismo'),
              ]),
            ]),
            TableRow(children: [
              getIconCell(PLURAL_ICON),
              getTextCell([
                TextSpan(text: 'Mal'),
                TextSpan(
                    text: 'i', style: TextStyle(fontWeight: FontWeight.bold)),
                TextSpan(text: ' čajevi'),
              ]),
              getTextCell([
                TextSpan(text: 'Mal'),
                TextSpan(
                    text: 'e', style: TextStyle(fontWeight: FontWeight.bold)),
                TextSpan(text: ' karte'),
              ]),
              getTextCell([
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

  getAdjectiveTable() {
    return Table(
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
            getIconCell(WidgetHelpers.getGenderIcon(GenderEnum.Masculine)),
            getIconCell(WidgetHelpers.getGenderIcon(GenderEnum.Feminine)),
            getIconCell(WidgetHelpers.getGenderIcon(GenderEnum.Neuter)),
          ],
        ),
        TableRow(children: [
          getIconCell(SINGULAR_ICON),
          getTextCell([TextSpan(text: 'Moj čaj')]),
          getTextCell([
            TextSpan(text: 'Moj'),
            TextSpan(text: 'a', style: TextStyle(fontWeight: FontWeight.bold)),
            TextSpan(text: ' karta'),
          ]),
          getTextCell([
            TextSpan(text: 'Moj'),
            TextSpan(text: 'e', style: TextStyle(fontWeight: FontWeight.bold)),
            TextSpan(text: ' pismo'),
          ]),
        ]),
        TableRow(children: [
          getIconCell(PLURAL_ICON),
          getTextCell([
            TextSpan(text: 'Moj'),
            TextSpan(text: 'i', style: TextStyle(fontWeight: FontWeight.bold)),
            TextSpan(text: ' čajevi'),
          ]),
          getTextCell([
            TextSpan(text: 'Moj'),
            TextSpan(text: 'e', style: TextStyle(fontWeight: FontWeight.bold)),
            TextSpan(text: ' karte'),
          ]),
          getTextCell([
            TextSpan(text: 'Moj'),
            TextSpan(text: 'a', style: TextStyle(fontWeight: FontWeight.bold)),
            TextSpan(text: ' pisma'),
          ]),
        ]),
      ],
    );
  }

  getTextCell(List<TextSpan> children) {
    return TableCell(
      child: Container(
        height: TABLE_CELL_HEIGHT,
        padding: EdgeInsets.all(CELL_TEXT_PADDING),
        child: RichText(
          text: TextSpan(
            style: TABLE_CELL_TEXT_STYLE,
            children: children,
          ),
        ),
      ),
    );
  }

  getIconCell(IconData icon) {
    return TableCell(
      child: Container(
        height: TABLE_CELL_HEIGHT,
        child: Icon(
          icon,
          color: ICON_COLOR,
        ),
      ),
    );
  }
}
