import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:navika/constants.dart';
import 'package:navika/models/enums.dart';
import 'package:navika/utilities/navika-helpers.dart';
import 'package:navika/widgets/grammar/grammar-guide/child-widgets/declension-table-cell.dart';
import 'package:navika/widgets/grammar/grammar-guide/child-widgets/explanation-icon-cell.dart';
import 'package:nrs_flutter_lib/constants.dart';
import 'package:nrs_flutter_lib/nrs_flutter_lib.dart';

class CountIcon extends StatelessWidget {
  const CountIcon({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Icon(
      Icons.circle,
      size: FONT_SIZE - 6,
      color: Colors.black.withOpacity(0.6),
    );
  }
}

class DeclensionTable extends StatelessWidget {
  final DeclensionTableCell masculineSingular;
  final DeclensionTableCell masculinePlural;

  final DeclensionTableCell feminineSingular;
  final DeclensionTableCell femininePlural;

  final DeclensionTableCell neuterSingular;
  final DeclensionTableCell neuterPlural;

  final String borderedItemNote;
  final bool showEqualItemNote;
  final Color additionalEqualItemColor;
  final List<String>? notes;

  const DeclensionTable({
    Key? key,
    required this.masculineSingular,
    required this.feminineSingular,
    required this.neuterSingular,
    required this.masculinePlural,
    required this.femininePlural,
    required this.neuterPlural,
    this.notes,
    this.borderedItemNote = '',
    this.showEqualItemNote = false,
    this.additionalEqualItemColor = EQUAL_ITEMS_BORDER_COLOR,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Nrs.getAppBarColor().withOpacity(0.5),
      child: Column(
        children: [
          //ActualTable_OLD(, feminineSingular: feminineSingular, femininePlural: femininePlural, masculineSingular: masculineSingular, masculinePlural: masculinePlural, neuterSingular: neuterSingular, neuterPlural: neuterPlural),
          Padding(
            padding: const EdgeInsets.only(
                top: FONT_SIZE * 2, bottom: FONT_SIZE * 2),
            child: Table(
              border: TableBorder.all(
                color: Colors.grey.withOpacity(0.8),
                borderRadius: BorderRadius.circular(FONT_SIZE),
              ),
              defaultVerticalAlignment: TableCellVerticalAlignment.middle,
              children: [
                TableRow(children: [
                  // Headers
                  TableCellWrapper(
                    isHeader: true,
                    child: Container(),
                  ),
                  ExplanationIconCell(
                    isHeader: true,
                    icon: Icon(N.getGenderIcon(Genders.Feminine),
                        color: FEMININE_COLOR),
                    label: AppLocalizations.of(context)!.feminine,
                  ),
                  ExplanationIconCell(
                    isHeader: true,
                    icon: Icon(N.getGenderIcon(Genders.Masculine),
                        color: MASCULINE_COLOR),
                    label: AppLocalizations.of(context)!.masculine,
                  ),
                  ExplanationIconCell(
                    isHeader: true,
                    icon: Icon(N.getGenderIcon(Genders.Neuter),
                        color: NEUTER_COLOR),
                    label: AppLocalizations.of(context)!.neuter,
                  ),
                ]),
                TableRow(children: [
                  ExplanationIconCell(
                    icon: CountIcon(),
                    label: AppLocalizations.of(context)!.singular,
                  ),
                  TableCellWrapper(child: feminineSingular),
                  TableCellWrapper(child: masculineSingular),
                  TableCellWrapper(child: neuterSingular),
                ]),
                TableRow(children: [
                  ExplanationIconCell(
                    icon: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CountIcon(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CountIcon(),
                            CountIcon(),
                          ],
                        )
                      ],
                    ),
                    label: AppLocalizations.of(context)!.plural,
                  ),
                  TableCellWrapper(child: femininePlural),
                  TableCellWrapper(child: masculinePlural),
                  TableCellWrapper(child: neuterPlural),
                ])
              ],
            ),
          ),
          if (notes != null)
            ...notes!.map(
              (note) => Padding(
                padding: const EdgeInsets.only(bottom: 12),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 8, right: 6),
                      child: Text(
                        getAsterisk(notes!.indexOf(note) + 1),
                        style: TextStyle(color: Colors.grey),
                      ),
                    ),
                    Flexible(
                      child: RichText(
                        maxLines: 10,
                        text: TextSpan(
                          style: TextStyle(
                              fontSize: 12,
                              color: Nrs.isDarkTheme(context)
                                  ? Colors.grey
                                  : Colors.black.withOpacity(0.7)),
                          children: [
                            TextSpan(text: note, style: DECLINED_LETTER_STYLE)
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          if (showEqualItemNote)
            Row(
              children: [
                Padding(
                  // Little square
                  padding: const EdgeInsets.only(right: 5),
                  child: Container(
                    width: 13,
                    height: 13,
                    decoration: BoxDecoration(
                      border: Border.all(color: EQUAL_ITEMS_BORDER_COLOR),
                      borderRadius: BorderRadius.circular(2),
                    ),
                  ),
                ),
                if (additionalEqualItemColor != EQUAL_ITEMS_BORDER_COLOR)
                  Padding(
                    // Little square 1
                    padding: const EdgeInsets.only(right: 5),
                    child: Container(
                      width: 13,
                      height: 13,
                      decoration: BoxDecoration(
                        border: Border.all(color: additionalEqualItemColor),
                        borderRadius: BorderRadius.circular(2),
                      ),
                    ),
                  ),
                RichText(
                  text: TextSpan(
                    style: TextStyle(
                        fontSize: 12,
                        color: Nrs.isDarkTheme(context)
                            ? Colors.white
                            : Colors.black),
                    children: [
                      TextSpan(
                        text: AppLocalizations.of(context)!.equalDeclensions,
                        style: DECLINED_LETTER_STYLE,
                      )
                    ],
                  ),
                ),
              ],
            ),
          borderedItemNote != ''
              ? Padding(
                  padding: const EdgeInsets.only(top: 8),
                  child: Row(
                    children: [
                      Padding(
                        // Little square 1
                        padding: const EdgeInsets.only(right: 5),
                        child: Container(
                          width: 13,
                          height: 13,
                          decoration: BoxDecoration(
                            border:
                                Border.all(color: Nrs.getPrimaryColor(context)),
                            borderRadius: BorderRadius.circular(2),
                          ),
                        ),
                      ),
                      RichText(
                        text: TextSpan(
                          style: TextStyle(
                              fontSize: 12,
                              color: Nrs.isDarkTheme(context)
                                  ? Colors.white
                                  : Colors.black),
                          children: [
                            TextSpan(
                                text: borderedItemNote,
                                style: DECLINED_LETTER_STYLE)
                          ],
                        ),
                      ),
                    ],
                  ),
                )
              : Container(),
        ],
      ),
    );
  }

  String getAsterisk(int count) {
    var result = '';

    for (int i = 0; i < count; i++) {
      result += '*';
    }

    return result;
  }
}

class TableCellWrapper extends StatelessWidget {
  final Widget child;
  final bool isHeader;

  const TableCellWrapper({
    Key? key,
    required this.child,
    this.isHeader = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TableCell(
      child: Container(height: this.isHeader ? 60 : 75, child: child),
      verticalAlignment: TableCellVerticalAlignment.middle,
    );
  }
}
