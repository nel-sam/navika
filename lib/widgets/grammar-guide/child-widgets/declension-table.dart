import 'package:flutter/material.dart';
import 'package:navika/constants.dart';
import 'package:navika/models/enums.dart';
import 'package:navika/utilities/navika-helpers.dart';
import 'package:navika/widgets/grammar-guide/child-widgets/declension-table-cell.dart';
import 'package:navika/widgets/grammar-guide/child-widgets/explanation-icon-cell.dart';

class DeclensionTable extends StatelessWidget {
  final DeclensionTableCell masculineSingular;
  final DeclensionTableCell feminineSingular;
  final DeclensionTableCell neuterSingular;
  final DeclensionTableCell masculinePlural;
  final DeclensionTableCell femininePlural;
  final DeclensionTableCell neuterPlural;
  final Color? coloredItemNoteColor;
  final String coloredItemNote;
  final String note;

  const DeclensionTable({
    Key? key,
    required this.masculineSingular,
    required this.feminineSingular,
    required this.neuterSingular,
    required this.masculinePlural,
    required this.femininePlural,
    required this.neuterPlural,
    this.note = '',
    this.coloredItemNote = '',
    this.coloredItemNoteColor = ACCENT_COLOR,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const colWidth = 100.0;
    const firstColWidth = 55.0;

    return Column(
      children: [
        Container(height: CELL_TEXT_PADDING + 5),
        Container(
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey),
          ),
          child: Column(
            children: [
              Row(
                children: [
                  Container(
                    width: firstColWidth,
                    height: 10.0,
                  ),
                  Container(
                    width: colWidth,
                    child: ExplanationIconCell(
                      icon: N.getGenderIcon(Genders.Masculine),
                      label: 'Masc.',
                    ),
                  ),
                  Container(
                    width: colWidth,
                    child: ExplanationIconCell(
                      icon: N.getGenderIcon(Genders.Feminine),
                      label: 'Fem.',
                    ),
                  ),
                  Container(
                    width: colWidth,
                    child: ExplanationIconCell(
                      icon: N.getGenderIcon(Genders.Neuter),
                      label: 'Neut.',
                    ),
                  ),
                ],
              ),
              Row(children: [
                Container(
                  width: firstColWidth,
                  child: ExplanationIconCell(
                    icon: SINGULAR_ICON,
                    label: 'Sing.',
                  ),
                ),
                masculineSingular,
                feminineSingular,
                neuterSingular
              ]),
              Row(children: [
                Container(
                  width: firstColWidth,
                  child: ExplanationIconCell(
                    icon: PLURAL_ICON,
                    label: 'Pl.',
                  ),
                ),
                masculinePlural,
                femininePlural,
                neuterPlural
              ]),
              coloredItemNote != ''
                  ? Padding(
                      padding: const EdgeInsets.fromLTRB(12, 12, 12, 0),
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.fromLTRB(2, 2, 4, 2),
                            child: Container(
                              width: 10,
                              height: 10,
                              color: coloredItemNoteColor,
                            ),
                          ),
                          RichText(
                            text: TextSpan(
                              style: TextStyle(
                                  fontSize: 12,
                                  color: N.isDarkTheme(context)
                                      ? Colors.white
                                      : Colors.black),
                              children: [
                                TextSpan(
                                    text: coloredItemNote,
                                    style: DECLINED_LETTER_STYLE)
                              ],
                            ),
                          ),
                        ],
                      ),
                    )
                  : Container(),
              note != ''
                  ? Padding(
                      padding: const EdgeInsets.fromLTRB(12, 4, 12, 12),
                      child: RichText(
                        text: TextSpan(
                          style: TextStyle(
                              fontSize: 12,
                              color: N.isDarkTheme(context)
                                  ? Colors.white
                                  : Colors.black),
                          children: [
                            TextSpan(text: '**'),
                            TextSpan(text: note, style: DECLINED_LETTER_STYLE)
                          ],
                        ),
                      ),
                    )
                  : Container(),
            ],
          ),
        )
      ],
    );
  }
}
