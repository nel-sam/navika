import 'package:flutter/material.dart';
import 'package:navika/constants.dart';
import 'package:navika/models/enums.dart';
import 'package:navika/utilities/navika-helpers.dart';
import 'package:navika/widgets/grammar-guide/child-widgets/declension-table-cell.dart';
import 'package:navika/widgets/grammar-guide/child-widgets/explanation-icon-cell.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class DeclensionTable extends StatelessWidget {
  final DeclensionTableCell masculineSingular;
  final DeclensionTableCell feminineSingular;
  final DeclensionTableCell neuterSingular;
  final DeclensionTableCell masculinePlural;
  final DeclensionTableCell femininePlural;
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

  String getAsterix(int count) {
    var result = '';

    for (int i = 0; i < count; i++) {
      result += '*';
    }

    return result;
  }

  @override
  Widget build(BuildContext context) {
    const colWidth = TABLE_CELL_WIDTH;
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
                    child: Center(
                      child: ExplanationIconCell(
                        icon: N.getGenderIcon(Genders.Feminine),
                        label: 'Fem.',
                      ),
                    ),
                  ),
                  Container(
                    width: colWidth,
                    child: Center(
                      child: ExplanationIconCell(
                        icon: N.getGenderIcon(Genders.Masculine),
                        label: 'Masc.',
                      ),
                    ),
                  ),
                  Container(
                    width: colWidth,
                    child: Center(
                      child: ExplanationIconCell(
                        icon: N.getGenderIcon(Genders.Neuter),
                        label: 'Neut.',
                      ),
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
                feminineSingular,
                masculineSingular,
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
                femininePlural,
                masculinePlural,
                neuterPlural
              ]),
              Padding(
                padding: EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (notes != null)
                      ...notes!.map(
                        (note) => Padding(
                          padding: const EdgeInsets.only(bottom: 12),
                          child: Row(
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.only(bottom: 8, right: 6),
                                child: Text(
                                  getAsterix(notes!.indexOf(note) + 1),
                                ),
                              ),
                              Flexible(
                                child: RichText(
                                  maxLines: 10,
                                  text: TextSpan(
                                    style: TextStyle(
                                        fontSize: 12,
                                        color: N.isDarkTheme(context)
                                            ? Colors.white
                                            : Colors.black),
                                    children: [
                                      TextSpan(
                                          text: note,
                                          style: DECLINED_LETTER_STYLE)
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
                                border:
                                    Border.all(color: EQUAL_ITEMS_BORDER_COLOR),
                                borderRadius: BorderRadius.circular(2),
                              ),
                            ),
                          ),
                          if (additionalEqualItemColor !=
                              EQUAL_ITEMS_BORDER_COLOR)
                            Padding(
                              // Little square 1
                              padding: const EdgeInsets.only(right: 5),
                              child: Container(
                                width: 13,
                                height: 13,
                                decoration: BoxDecoration(
                                  border: Border.all(
                                      color: additionalEqualItemColor),
                                  borderRadius: BorderRadius.circular(2),
                                ),
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
                                  text: AppLocalizations.of(context)!
                                      .equalDeclensions,
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
                                      border: Border.all(color: ACCENT_COLOR),
                                      borderRadius: BorderRadius.circular(2),
                                    ),
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
              ),
            ],
          ),
        )
      ],
    );
  }
}
